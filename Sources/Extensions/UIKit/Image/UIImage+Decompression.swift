import UIKit

public extension UIImage {
	
	/**
	 Returns an image decompressed by redrawing it in graphics context.
	 */
	var decompressed: UIImage {
		guard
			let cgImage,
			let context = CGContext(
				data: nil,
				width: Int(size.width),
				height: Int(size.height),
				bitsPerComponent: 8,
				bytesPerRow: 0,
				space: CGColorSpaceCreateDeviceRGB(),
				bitmapInfo: cgImage.alphaInfo.rawValue
			)
		else {
			return self
		}
		let rect = CGRect(
			origin: .zero,
			size: size
		)
		context.draw(
			cgImage,
			in: rect
		)
		guard let decompressedImage = context.makeImage() else {
			return self
		}
		return UIImage(
			cgImage: decompressedImage,
			scale: scale,
			orientation: imageOrientation
		)
	}
	
}
