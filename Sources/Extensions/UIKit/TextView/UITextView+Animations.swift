import UIKit

public extension UITextView {
	
	/// Creates a transition animation from receivers text color to the specified new one.
	/// - Parameters:
	///   - newColor: New text color value.
	///   - duration: The total duration of the animations, measured in seconds.
	///   - delay: The amount of time (measured in seconds) to wait before beginning the animations.
	///   - completion: A block object to be executed when the animation sequence ends.
	func animateTransition(
		newColor: UIColor,
		duration: TimeInterval = 0.3,
		delay: TimeInterval = 0,
		completion: ((Bool) -> Void)? = nil
	) {
		if delay > 0 {
			DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
				UIView.transition(
					with: self,
					duration: duration,
					options: .transitionCrossDissolve,
					animations: { self.textColor = newColor },
					completion: completion
				)
			}
		} else {
			UIView.transition(
				with: self,
				duration: duration,
				options: .transitionCrossDissolve,
				animations: { self.textColor = newColor },
				completion: completion
			)
		}
	}
	
	/// Creates a transition animation from receivers text to the specified new one.
	/// - Parameters:
	///   - newText: New text value.
	///   - duration: The total duration of the animations, measured in seconds.
	///   - delay: The amount of time (measured in seconds) to wait before beginning the animations.
	///   - completion: A block object to be executed when the animation sequence ends.
	func animateTransition(
		newText: String,
		duration: TimeInterval = 0.3,
		delay: TimeInterval = 0,
		completion: ((Bool) -> Void)? = nil
	) {
		if delay > 0 {
			DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
				UIView.transition(
					with: self,
					duration: duration,
					options: .transitionCrossDissolve,
					animations: { self.text = newText },
					completion: completion
				)
			}
		} else {
			UIView.transition(
				with: self,
				duration: duration,
				options: .transitionCrossDissolve,
				animations: { self.text = newText },
				completion: completion
			)
		}
	}
	
}
