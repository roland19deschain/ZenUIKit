import UIKit
import ZenCoreGraphics

public extension UIImage {
	
	/**
	 Initializes and returns the image object with the specified color and size.
	 - parameter color: The color of new image.
	 - parameter size: The size of new image (default value is width: 1, height: 1)
	 - returns: An initialized UIImage object, or nil if the method could not draw the image.
	 */
	convenience init?(
		color: UIColor,
		size: CGSize = CGSize(width: 1, height: 1)
	) {
		guard let cgImage = UIGraphicsImageRenderer(
			size: size,
			opaque: false,
			scale: 1
		).image(actions: { _ in
			color.setFill()
			UIRectFill( CGRect(size: size))
		}).cgImage else {
			return nil
		}
		self.init(cgImage: cgImage)
	}
	
}
