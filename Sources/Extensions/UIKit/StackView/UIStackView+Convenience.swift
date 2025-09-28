import UIKit

public extension UIStackView {
	
	/// Adds multiple views from an array to the end of the arrangedSubviews array.
	/// - Parameter views: Array of views to be added.
	func addArrangedSubviews(_ views: [UIView]) {
		views.forEach { addArrangedSubview($0) }
	}
	
	/// Adds multiple views to the end of the arrangedSubviews array.
	/// - Parameter views: The views to be added.
	func addArrangedSubviews(_ views: UIView...) {
		views.forEach { addArrangedSubview($0) }
	}
	
	/// Removes all views from the list of arranged subviews,
	/// also removing them from the stack view’s hierarchy.
	/// - Returns: The views that were removed.
	@discardableResult func removeAllArrangedSubviews() -> [UIView] {
		let result = arrangedSubviews
		result.forEach {
			removeArrangedSubview($0)
			$0.removeFromSuperview()
		}
		return result
	}
	
}
