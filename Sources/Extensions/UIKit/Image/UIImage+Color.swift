import UIKit

public extension UIImage {
	
	/// Returns the color of the pixel at the specified position.
	/// - Parameter position: The color of the pixel at the specified position.
	/// - Returns: The color of the pixel at the specified position.
	func color(at position: CGPoint) -> UIColor? {
		guard
			CGRect(origin: .zero, size: size).contains(position),
			let pixelData = cgImage?.dataProvider?.data
		else {
			return nil
		}
		let data: UnsafePointer<UInt8> = CFDataGetBytePtr(pixelData)
		let pixelInfo: Int = ((Int(size.width) * Int(position.y)) + Int(position.x)) * 4
		return UIColor(
			red: CGFloat(data[pixelInfo]) / 255,
			green: CGFloat(data[pixelInfo + 1]) / 255,
			blue: CGFloat(data[pixelInfo + 2]) / 255,
			alpha: CGFloat(data[pixelInfo + 3]) / 255
		)
	}
	
	/// Returns average color of receiver.
	var averageColor: UIColor? {
		guard let inputImage = CIImage(image: self) else {
			return nil
		}
		let extentVector = CIVector(
			x: inputImage.extent.origin.x,
			y: inputImage.extent.origin.y,
			z: inputImage.extent.size.width,
			w: inputImage.extent.size.height
		)
		guard
			let filter = CIFilter(
				name: "CIAreaAverage",
				parameters: [
					kCIInputImageKey: inputImage,
					kCIInputExtentKey: extentVector
				]
			),
			let outputImage = filter.outputImage
		else {
			return nil
		}
		var bitmap: [UInt8] = .init(repeating: 0, count: 4)
		let context = CIContext(options: [.workingColorSpace: kCFNull as Any])
		context.render(
			outputImage,
			toBitmap: &bitmap,
			rowBytes: 4,
			bounds: CGRect(x: 0, y: 0, width: 1, height: 1),
			format: .RGBA8,
			colorSpace: nil
		)
		return UIColor(
			red: CGFloat(bitmap[0]) / 255,
			green: CGFloat(bitmap[1]) / 255,
			blue: CGFloat(bitmap[2]) / 255,
			alpha: CGFloat(bitmap[3]) / 255
		)
	}
	
	/// Fills all opaque pixels of the image with color.
	/// - Parameter color: Fill color for image.
	/// - Returns: The tinted picture.
	func tinted(in color: UIColor) -> UIImage {
		let width: CGFloat = size.width * scale
		let height: CGFloat = size.height * scale
		let bounds = CGRect(
			x: 0,
			y: 0,
			width: width,
			height: height
		)
		let alphaInfo = CGImageAlphaInfo.premultipliedLast.rawValue
		
		guard
			let context = CGContext(
				data: nil,
				width: Int(width),
				height: Int(height),
				bitsPerComponent: 8,
				bytesPerRow: 0,
				space: CGColorSpaceCreateDeviceRGB(),
				bitmapInfo: CGBitmapInfo(rawValue: alphaInfo).rawValue
			),
			let cgImage
		else {
			return self
		}
		context.clip(
			to: bounds,
			mask: cgImage
		)
		context.setFillColor(color.cgColor)
		context.fill(bounds)
		
		guard let cgImage = context.makeImage() else {
			return self
		}
		return UIImage(
			cgImage: cgImage,
			scale: scale,
			orientation: imageOrientation
		)
	}
	
	/// Returns a black and white version of the image.
	var grayscaleImage: UIImage? {
		let bitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.none.rawValue)
		let context = CGContext(
			data: nil,
			width: Int(size.width),
			height: Int(size.height),
			bitsPerComponent: 8,
			bytesPerRow: 0,
			space: CGColorSpaceCreateDeviceGray(),
			bitmapInfo: bitmapInfo.rawValue
		)
		guard let cgImage, let context else {
			return nil
		}
		let imageRect: CGRect = CGRect(
			origin: .zero,
			size: size
		)
		context.draw(
			cgImage,
			in: imageRect
		)
		return context.makeImage().map {
			UIImage(cgImage: $0)
		}
	}
	
	/// Removes the color variance from an image then tint it to specified color.
	func monochromeImage(inputColor: UIColor = .gray) -> UIImage? {
		guard
			let currentCIImage = CIImage(image: self),
			let filter = CIFilter(name: "CIColorMonochrome")
		else {
			return nil
		}
		filter.setValue(currentCIImage, forKey: "inputImage")
		filter.setValue(1, forKey: "inputIntensity")
		filter.setValue(CIColor(color: inputColor), forKey: "inputColor")
		guard
			let outputImage = filter.outputImage,
			let cgImage = CIContext().createCGImage(
				outputImage,
				from: outputImage.extent
			)
		else {
			return nil
		}
		return UIImage(cgImage: cgImage)
	}
	
}
