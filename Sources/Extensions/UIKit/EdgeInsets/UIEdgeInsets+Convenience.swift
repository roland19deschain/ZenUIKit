import UIKit

// MARK: - Life Cycle

public extension UIEdgeInsets {
	
	/// Builds an edge instets with all values equal to 'uniform' argument.
	/// - parameter uniform: Amount to inset (positive) for all of the edges. Value can be negative to 'outset'.
	/// - returns: A new edge insets instance with all equal values.
	init(uniform: CGFloat) {
		self.init(
			top: uniform,
			left: uniform,
			bottom: uniform,
			right: uniform
		)
	}
	
	
	/// Builds an edge instets with 'left' and 'right' edges equals to 'horizontal' argument
	/// and 'top' and 'bottom' edges equals to 'vertical' argument.
	/// - parameter horizontal: Amount to inset (positive) for 'left' and 'right' edges. Value can be negative to 'outset'.
	/// - parameter vertical: Amount to inset (positive) for 'top' and 'bottom' edges. Value can be negative to 'outset'.
	/// - returns: A new edge insets instance.
	init(
		horizontal: CGFloat,
		vertical: CGFloat
	) {
		self.init(
			top: vertical,
			left: horizontal,
			bottom: vertical,
			right: horizontal
		)
	}
	
}

// MARK: - Introspection

public extension UIEdgeInsets {
	
	/// Returns the sum of left and right insets.
	var horizontal: CGFloat {
		left + right
	}
	
	/// Returns the sum of top and bottom insets.
	var vertical: CGFloat {
		top + bottom
	}
	
}
