import UIKit

public extension NSLayoutConstraint {
	
	/// Returns the constraint sender with the passed priority.
	///
	/// - Parameter priority: The priority to be set.
	/// - Returns: The receiver adjusted with the new priority.
	func priority(_ priority: Float) -> NSLayoutConstraint {
		self.priority = .init(priority)
		return self
	}

	/// Returns the constraint sender with the passed priority.
	///
	/// - Parameter priority: The priority to be set.
	/// - Returns: The receiver adjusted with the new priority.
	func priority(_ priority: UILayoutPriority) -> NSLayoutConstraint {
		self.priority = priority
		return self
	}

}

public extension NSLayoutConstraint {

	/// Activate the layouts defined in the result builder parameter `constraints`.
	static func activate(
		@AutoLayoutBuilder constraints: () -> [NSLayoutConstraint]
	) {
		activate(constraints())
	}

}
