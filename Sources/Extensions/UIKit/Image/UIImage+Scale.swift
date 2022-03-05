import UIKit

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
		return UIGraphicsImageRenderer(size: scaledImageSize).image { _ in
			self.draw(in: CGRect(
				origin: .zero,
				size: scaledImageSize
			))
		}
		
	}
	
}
