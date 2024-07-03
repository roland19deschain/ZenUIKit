import UIKit

public extension UIImage {
	
	/// Returns the orientation of the receiver’s image.
	var cgImageOrientation: CGImagePropertyOrientation {
		CGImagePropertyOrientation(imageOrientation)
	}
	
}
