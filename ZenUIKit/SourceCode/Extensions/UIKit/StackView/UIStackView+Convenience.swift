import UIKit

public extension UIStackView {
	
	/// Adds a views to the end of the arrangedSubviews array,
	/// also automatically adds each of the provided views as a subview of the stack view, if it is not already.
	func addArrangedSubviews(_ arrangedSubviews: [UIView]) {
		arrangedSubviews.forEach {
			addArrangedSubview($0)
		}
	}
	
	/// Removes a subview from the list of arranged subviews,
	/// also removing it as a subview of the receiver.
	func removeAllArrangedSubviews() {
		arrangedSubviews.forEach {
			$0.removeFromSuperview()
		}
	}
	
}
