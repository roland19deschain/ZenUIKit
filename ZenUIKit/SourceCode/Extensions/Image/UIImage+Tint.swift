import UIKit

public extension UIImage {
	
	/**
	Fills all opaque pixels of the image with color.
	- parameter color: Fill color for image.
	- returns: Tinted picture.
	*/
	func tinted(in color: UIColor) -> UIImage {
		guard let maskImage = cgImage else {
			return self
		}
		
		let width = size.width * scale
		let height = size.height * scale
		let bounds = CGRect(
			x: 0,
			y: 0,
			width: width,
			height: height
		)
		
		let alphaInfo = CGImageAlphaInfo.premultipliedLast.rawValue
		
		guard let context = CGContext(
			data: nil,
			width: Int(width),
			height: Int(height),
			bitsPerComponent: 8,
			bytesPerRow: 0,
			space: CGColorSpaceCreateDeviceRGB(),
			bitmapInfo: CGBitmapInfo(rawValue: alphaInfo).rawValue
			) else {
				return self
		}
		
		context.clip(
			to: bounds,
			mask: maskImage
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
	
}
