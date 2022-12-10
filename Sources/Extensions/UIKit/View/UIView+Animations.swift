import UIKit

public extension UIView {
	
	/**
	 Animates the alpha (transparency) of the receiver (layer) from 0 to 1.
	 - parameter delay: The amount of time (measured in seconds) to wait before beginning the animations.
	 - parameter duration: The total duration of the animations, measured in seconds.
	 - parameter completion: A block object to be executed when the animation sequence ends.
	 */
	func animateFadeIn(
		delay: TimeInterval = 0,
		duration: TimeInterval = 0.3,
		completion: (() -> Void)? = nil
	) {
		CATransaction.begin()
		
		if let completion {
			CATransaction.setCompletionBlock(completion)
		}
		
		let animation: CABasicAnimation = .init(
			keyPath: #keyPath(CALayer.opacity)
		)
		if delay > 0 {
			animation.beginTime = CACurrentMediaTime() + delay
		}
		animation.fromValue = 0
		animation.toValue = 1
		animation.duration = duration
		animation.fillMode = .forwards
		animation.isRemovedOnCompletion = false
		
		layer.add(
			animation,
			forKey: "FadeIn"
		)
		
		CATransaction.commit()
	}
	
	/**
	 Animates the alpha (transparency) of the receiver (layer) from 1 to 0.
	 - parameter delay: The amount of time (measured in seconds) to wait before beginning the animations.
	 - parameter duration: The total duration of the animations, measured in seconds.
	 - parameter completion: A block object to be executed when the animation sequence ends.
	 */
	func animateFadeOut(
		delay: TimeInterval = 0,
		duration: TimeInterval = 0.3,
		completion: (() -> Void)? = nil
	) {
		CATransaction.begin()
		
		if let completion {
			CATransaction.setCompletionBlock(completion)
		}
		
		let animation: CABasicAnimation = .init(
			keyPath: #keyPath(CALayer.opacity)
		)
		if delay > 0 {
			animation.beginTime = CACurrentMediaTime() + delay
		}
		animation.fromValue = 1
		animation.toValue = 0
		animation.duration = duration
		animation.fillMode = .forwards
		animation.isRemovedOnCompletion = false
		
		layer.add(
			animation,
			forKey: "FadeOut"
		)
		
		CATransaction.commit()
	}
	
	/**
	 Animates horizontal shaking of the receiver.
	 - parameter delay: The amount of time (measured in seconds) to wait before beginning the animations.
	 - parameter duration: The total duration of the animations, measured in seconds.
	 - parameter completion: A block object to be executed when the animation sequence ends.
	 */
	func animateHorizontalShake(
		delay: TimeInterval = 0,
		duration: TimeInterval = 0.6,
		completion: (() -> Void)? = nil
	) {
		CATransaction.begin()
		
		if let completion {
			CATransaction.setCompletionBlock(completion)
		}
		
		let animation = CAKeyframeAnimation(
			keyPath: "transform.translation.x"
		)
		if delay > 0 {
			animation.beginTime = CACurrentMediaTime() + delay
		}
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
			forKey: "HorizontalShake"
		)
		
		CATransaction.commit()
	}
	
	/**
	 Animates scale pulse of the receiver.
	 - parameter delay: The amount of time (measured in seconds) to wait before beginning the animations.
	 - parameter duration: The total duration of the animations, measured in seconds.
	 - parameter scale: The factor by which to scale the x and y axis of the receiver layer.
	 - parameter completion: A block object to be executed when the animation sequence ends.
	 */
	func animatePulse(
		delay: TimeInterval = 0,
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
		
		if delay > 0 {
			animation.beginTime = CACurrentMediaTime() + delay
		}
		
		layer.add(
			animation,
			forKey: "ScalePulse"
		)
		
		CATransaction.commit()
	}
	
}
