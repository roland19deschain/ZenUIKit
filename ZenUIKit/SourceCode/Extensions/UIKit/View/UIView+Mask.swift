import UIKit

public extension UIView {
	
	/**
	Rounds specified corners with specified radius.
	- parameter corners: A bitmask value that identifies the corners that you want rounded.
	- parameter radius: The radius of each corner oval.
	*/
	func round(corners: UIRectCorner, radius: CGFloat) {
		let mask = CAShapeLayer()
		mask.path = UIBezierPath(
			roundedRect: bounds,
			byRoundingCorners: corners,
			cornerRadii: CGSize(width: radius, height: radius)
		).cgPath
		layer.mask = mask
	}
	
}
