import UIKit

public protocol SuperviewProtocol {}

extension UIView: SuperviewProtocol {}

public extension SuperviewProtocol where Self == UIView {

	/// Add a child subview and directly activate the given constraints.
	func addSubview<View: UIView>(
		_ view: View,
		@AutoLayoutBuilder constraints: () -> [NSLayoutConstraint]
	) {
		addSubview(view)
		NSLayoutConstraint.activate(constraints())
	}

	/// Add a child subviews and directly activate the given constraints.
	func addSubviews<View: UIView>(
		_ views: [View],
		@AutoLayoutBuilder constraints: () -> [NSLayoutConstraint]
	) {
		views.forEach {
			addSubview($0)
		}
		NSLayoutConstraint.activate(constraints())
	}

}
