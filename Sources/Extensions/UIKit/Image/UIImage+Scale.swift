import UIKit
import ZenCoreGraphics

public extension UIImage {
	
	/**
	 Creates a image based on the receiver and scale it to the specified size.
	 - parameter targetSize: The desired size for scaling a image.
	 - returns: The image scaled to the specified size (the size of the image may differ from *targetSize*, to preserve the aspect ratio).
	 */
	func scaled(to targetSize: CGSize) -> UIImage {
		let scaleFactor = min(
			targetSize.width / size.width,
			targetSize.height / size.height
		)
		let scaledImageSize = CGSize(
			width: size.width * scaleFactor,
			height: size.height * scaleFactor
		)
		return UIGraphicsImageRenderer(
			size: scaledImageSize,
			opaque: hasAlphaChannel,
			scale: scale
		).image { _ in
			draw(in: CGRect(size: scaledImageSize))
		}
	}
	
	/// Returns image resized to the specified size.
	func resized(to targetSize: CGSize) -> UIImage {
		let imageSize = size
		let widthRatio = targetSize.width / imageSize.width
		let heightRatio = targetSize.height / imageSize.height
		let newSize: CGSize
		if widthRatio > heightRatio {
			newSize = CGSize(
				width: imageSize.width * heightRatio,
				height: imageSize.height * heightRatio
			)
		} else {
			newSize = CGSize(
				width: imageSize.width * widthRatio,
				height: imageSize.height * widthRatio
			)
		}
		return UIGraphicsImageRenderer(
			size: newSize,
			opaque: hasAlphaChannel,
			scale: scale
		).image { context in
			draw(in: CGRect(size: newSize))
		}
	}
	
}
