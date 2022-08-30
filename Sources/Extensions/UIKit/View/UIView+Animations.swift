import UIKit

public extension UIView {
	
	/**
	Animates horizontal shaking of the receiver.
	- parameter completion: A block object to be executed when the animation sequence ends.
	*/
	func horizontalShake(completion: (() -> Void)? = nil) {
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
		animation.duration = 0.6
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
	
}
