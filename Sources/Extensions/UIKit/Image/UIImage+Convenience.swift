import UIKit

extension UIImage {
	
	/// Returns the orientation of the receiver’s image.
	var cgImageOrientation: CGImagePropertyOrientation {
		.init(imageOrientation)
	}
	
}
