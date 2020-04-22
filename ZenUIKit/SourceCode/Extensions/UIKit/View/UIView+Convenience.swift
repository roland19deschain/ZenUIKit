import UIKit

public extension UIView {
	
	/// Returns a string identifying the view object to be reused.
	static var reuseIdentifier: String {
		String(describing: Self.self)
	}
	
	/// Returns the first responder, if one exists (searches recursively, throughout the whole hierarchy).
	var currentFirstResponder: UIResponder? {
		guard !isFirstResponder else {
			return self
		}
		return subviews.first {
			$0.currentFirstResponder != nil
		}
	}
	
}
