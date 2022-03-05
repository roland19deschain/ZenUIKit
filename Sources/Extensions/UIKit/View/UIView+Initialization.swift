import UIKit

public extension UIView {
	
	/// Initializes and returns a newly allocated view object with the specified color.
	convenience init(color: UIColor) {
		self.init()
		
		backgroundColor = color
	}
	
}
