import UIKit

public extension Array where Element: NSLayoutConstraint {
	
	/// Activates each constraint in the reciever.
	func activate() {
		NSLayoutConstraint.activate(self)
	}
	
}
