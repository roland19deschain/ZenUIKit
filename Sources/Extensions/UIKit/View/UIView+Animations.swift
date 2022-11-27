import UIKit

public extension UIView {
	
	/**
	 Animates horizontal shaking of the receiver.
	 - parameter duration: The total duration of the animations, measured in seconds.
	 - parameter completion: A block object to be executed when the animation sequence ends.
	 */
	func animateHorizontalShake(
		duration: TimeInterval = 0.6,
		completion: (() -> Void)? = nil
	) {
		CATransaction.begin()
		
		if let completion = completion {
			CATransaction.setCompletionBlock(completion)
		}
		
		let animation = CAKeyframeAnimation(
			keyPath: "transform.translation.x"
		)
		animation.timingFunction = CAMediaTimingFunction(
			name: .easeInEaseOut
		)
		animation.duration = max(0, duration)
		animation.values = [
			-20.0, 20.0,
			 -20.0, 20.0,
			 -10.0, 10.0,
			 -5.0, 5.0,
			 0.0
		]
		
		layer.add(
			animation,
			forKey: "Shake"
		)
		
		CATransaction.commit()
	}
	
	/**
	 Animates scale pulse of the receiver.
	 - parameter duration: The total duration of the animations, measured in seconds.
	 - parameter scale: The factor by which to scale the x and y axis of the receiver layer.
	 - parameter completion: A block object to be executed when the animation sequence ends.
	 */
	func animatePulse(
		duration: TimeInterval = 0.4,
		scale: Double = 1.3,
		completion: (() -> Void)? = nil
	) {
		CATransaction.begin()
		
		if let completion {
			CATransaction.setCompletionBlock(completion)
		}
		
		let animation = CASpringAnimation(keyPath: "transform.scale")
		animation.duration = max(0, duration) / 2
		animation.fromValue = 1
		animation.toValue = scale
		animation.autoreverses = true
		animation.repeatCount = 1
		animation.initialVelocity = 0.5
		animation.damping = 0.8
		
		layer.add(
			animation,
			forKey: "Shake"
		)
		
		CATransaction.commit()
	}
	
}
