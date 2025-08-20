import UIKit

public extension NSDirectionalEdgeInsets {
	
	/// Creates directional edge insets with uniform values for all edges.
	/// - Parameter uniform: The value to use for all edges (top, leading, bottom, trailing).
	///
	/// Example:
	/// ```
	/// let insets = NSDirectionalEdgeInsets(uniform: 16)
	/// // Results: top: 16, leading: 16, bottom: 16, trailing: 16
	/// ```
	init(uniform: CGFloat) {
		self.init(
			top: uniform,
			leading: uniform,
			bottom: uniform,
			trailing: uniform
		)
	}
	
	/// Creates directional edge insets with horizontal and vertical values.
	/// - Parameters:
	///   - horizontal: The value to use for leading and trailing edges.
	///   - vertical: The value to use for top and bottom edges.
	///
	/// Example:
	/// ```
	/// let insets = NSDirectionalEdgeInsets(horizontal: 20, vertical: 10)
	/// // Results: top: 10, leading: 20, bottom: 10, trailing: 20
	/// ```
	init(
		horizontal: CGFloat,
		vertical: CGFloat
	) {
		self.init(
			top: vertical,
			leading: horizontal,
			bottom: vertical,
			trailing: horizontal
		)
	}
	
}
