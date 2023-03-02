import UIKit

public extension Array where Element: NSLayoutConstraint {
	
	/// Activates each constraint in the reciever.
	func activate() {
		NSLayoutConstraint.activate(self)
	}
	
	/// Returns a new array with prioritized constraints.
	///
	/// - Parameter priority: The priority to be set.
	/// - Returns: A new array with prioritized constraints.
	func priority(_ priority: Float) -> [NSLayoutConstraint] {
		map {
			$0.priority(priority)
		}
	}
	
	/// Returns a new array with prioritized constraints.
	///
	/// - Parameter priority: The priority to be set.
	/// - Returns: A new array with prioritized constraints.
	func priority(_ priority: UILayoutPriority) -> [NSLayoutConstraint] {
		map {
			$0.priority(priority)
		}
	}
	
}
