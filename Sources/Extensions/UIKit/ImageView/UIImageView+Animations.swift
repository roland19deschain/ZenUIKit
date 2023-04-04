import UIKit

public extension UIImageView {
	
	/// Creates a transition animation for the specified image in 'cross dissolve' style.
	/// - Parameters:
	///   - newImage: The new image to be displayed in the image view.
	///   - duration: The duration of the transition animation, measured in seconds (default value is 0.3).
	///   - completion: A block object to be executed when the animation sequence ends.
	func animateTransition(
		newImage: UIImage?,
		duration: TimeInterval = 0.2,
		delay: TimeInterval = 0,
		completion: ((Bool) -> Void)? = nil
	) {
		if delay > 0 {
			DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
				UIView.transition(
					with: self,
					duration: duration,
					options: .transitionCrossDissolve,
					animations: { self.image = newImage },
					completion: completion
				)
			}
		} else {
			UIView.transition(
				with: self,
				duration: duration,
				options: .transitionCrossDissolve,
				animations: { self.image = newImage },
				completion: completion
			)
		}
	}
	
}
