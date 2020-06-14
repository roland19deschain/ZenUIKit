import UIKit

public extension UIScrollView {
	
	/**
	Scrolls content to the top edge.
	- parameter animated: Specify _true_ to animate the transition at a constant velocity,
	_false_ to make the transition immediate.
	*/
	func scrollToTop(animated: Bool) {
		setContentOffset(
			.zero,
			animated: animated
		)
	}
	
	/**
	Scrolls content to the bottom edge.
	- parameter animated: Specify _true_ to animate the transition at a constant velocity,
	_false_ to make the transition immediate.
	*/
	func scrollToBottom(animated: Bool) {
		let y: CGFloat = contentSize.height
			+ contentInset.bottom
			+ safeAreaInsets.bottom
			- bounds.height
		setContentOffset(
			CGPoint(
				x: 0,
				y: max(y, 0)
			),
			animated: animated
		)
	}
	
}
