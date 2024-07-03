import UIKit

public extension UIView {
	
	/// Returns a string identifying the view object to be reused.
	static var reuseIdentifier: String {
		String(describing: Self.self)
	}
	
	/// Adds a views to the end of the receiver’s list of subviews.
	func addSubviews(_ subviews: [UIView]) {
		subviews.forEach {
			addSubview($0)
		}
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
	
	/// Returns an image with complete view hierarchy visible on screen.
	var snapshot: UIImage? {
		UIGraphicsImageRenderer(
			size: frame.size,
			opaque: false,
			scale: UIScreen.main.scale
		).image { _ in
			drawHierarchy(
				in: frame,
				afterScreenUpdates: true
			)
		}
	}
	
}
