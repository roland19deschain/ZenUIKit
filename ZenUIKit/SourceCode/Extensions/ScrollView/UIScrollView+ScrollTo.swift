import UIKit

public extension UIScrollView {
	
	/**
	Scrolls content to the top edge.
	- parameter animated: true to animate the transition at a constant velocity,
	false to make the transition immediate.
	*/
	func scrollToTop(animated: Bool) {
		setContentOffset(
			.zero,
			animated: animated
		)
	}
	
	/**
	Scrolls content to the bottom edge.
	- parameter animated: true to animate the transition at a constant velocity,
	false to make the transition immediate.
	*/
	func scrollToBottom(animated: Bool) {
		let y: CGFloat = max(contentSize.height - bounds.height, 0)
		
		setContentOffset(
			CGPoint(
				x: 0,
				y: y
			),
			animated: animated
		)
	}
	
}
