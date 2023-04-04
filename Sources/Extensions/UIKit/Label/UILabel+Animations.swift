import UIKit

public extension UILabel {
	
	/// Creates a transition animation from receivers text color to the specified new one.
	/// - Parameters:
	///   - duration: The total duration of the animations, measured in seconds.
	///   - delay: The amount of time (measured in seconds) to wait before beginning the animations.
	///   - newColor: New text color value.
	///   - completion: A block object to be executed when the animation sequence ends.
	func animateTextColor(
		duration: TimeInterval = 0.3,
		delay: TimeInterval = 0,
		newColor: UIColor,
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
	///   - duration: The total duration of the animations, measured in seconds.
	///   - delay: The amount of time (measured in seconds) to wait before beginning the animations.
	///   - newText: New text value.
	///   - completion: A block object to be executed when the animation sequence ends.
	func animateTextChange(
		duration: TimeInterval = 0.3,
		delay: TimeInterval = 0,
		newText: String,
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
