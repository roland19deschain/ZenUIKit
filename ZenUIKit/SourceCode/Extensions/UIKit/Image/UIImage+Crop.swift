import UIKit

public extension UIImage {
	
	/**
	Creates a bitmap image using the data contained within a subregion of an existing bitmap image.
	- parameter rect: A rectangle specifying the portion of the image to keep.
	If the rect parameter defines an area that is not in the image, returns original image.
	- returns: A subimage of the image.
	*/
	func cropped(to rect: CGRect) -> UIImage {
		guard let cgImage = cgImage,
			let image = cgImage.cropping(to: rect) else {
				return self
		}
		return UIImage(
			cgImage: image,
			scale: scale,
			orientation: imageOrientation
		)
	}
	
}
