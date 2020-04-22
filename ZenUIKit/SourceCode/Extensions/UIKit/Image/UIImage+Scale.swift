import UIKit

public extension UIImage {
	
	/**
	Creates a image based on the receiver and scale it to the specified size.
	- parameter orientation: The size for scaling a image.
	- returns: The image scaled to the specified size.
	*/
	func scaled(to size: CGSize) -> UIImage {
		UIGraphicsBeginImageContextWithOptions(
			size,
			false,
			scale
		)
		
		defer {
			UIGraphicsEndImageContext()
		}
		
		draw(in:
			CGRect(
				origin: .zero,
				size: size
			)
		)
		
		return UIGraphicsGetImageFromCurrentImageContext() ?? self
	}
	
}
