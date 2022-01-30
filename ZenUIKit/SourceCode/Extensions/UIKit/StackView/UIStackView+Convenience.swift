import UIKit

public extension UIStackView {
	
	/// Removes a subview from the list of arranged subviews,
	/// also removing it as a subview of the receiver.
	func removeAllArrangedSubviews() {
		arrangedSubviews.forEach {
			$0.removeFromSuperview()
		}
	}
	
}
