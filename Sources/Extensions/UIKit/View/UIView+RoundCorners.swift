import UIKit

// MARK: - BezierPath

public extension UIView {
	
	/**
	Rounds specified corners with specified radius.
	- parameter corners: A bitmask value that identifies the corners that you want round.
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

// MARK: - Convenience

public extension UIView {
	
	enum Corner: CaseIterable {
		case topRight
		case bottomRight
		case topLeft
		case bottomLeft
	}
	
	/**
	Rounds specified corners with specified radius.
	- parameter corners: The corners that you want round.
	- parameter radius: The radius of each corner oval.
	*/
	func round(corners: [Corner], radius: CGFloat) {
		layer.maskedCorners = corners.reduce(
			CACornerMask()
		) { partialResult, corner in
			switch corner {
			case .topRight:
				return partialResult.union(.layerMaxXMinYCorner)
			case .bottomRight:
				return partialResult.union(.layerMaxXMaxYCorner)
			case .topLeft:
				return partialResult.union(.layerMinXMinYCorner)
			case .bottomLeft:
				return partialResult.union(.layerMinXMaxYCorner)
			}
		}
		layer.cornerRadius = radius
	}
	
	/**
	Rounds specified corners with specified radius animated.
	- parameter corners: The corners that you want round.
	- parameter radius: The radius of each corner oval.
	- parameter duration: The total duration of the animation, measured in seconds. If you specify a negative value or 0, the changes are made without animating them.
	- parameter completion: A block object to be executed when the animation sequence ends.
	*/
	func round(
		corners: [Corner],
		radius: CGFloat,
		duration: TimeInterval,
		completion: (() -> Void)? = nil
	) {
		UIView.animate(
			withDuration: duration,
			delay: 0,
			options: .curveEaseInOut
		) {
			self.round(corners: corners, radius: radius)
		} completion: { _ in
			completion?()
		}
	}
	
}
