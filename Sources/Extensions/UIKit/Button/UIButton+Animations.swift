import UIKit

public extension UIButton {
	
	/// Sets the title to use animated, for the specified state.
	/// - Parameters:
	///   - title: The title to use for the specified state.
	///   - state: The state that uses the specified title. `UIControl.State` describes the possible values.
	///   - duration: The total duration of the animations, measured in seconds.
	///   - delay: The amount of time (measured in seconds) to wait before beginning the animations.
	///   - completion: A block object to be executed when the animation sequence ends.
	func setTitleAnimated(
		title: String,
		state: UIControl.State,
		duration: TimeInterval = 0.3,
		delay: TimeInterval = 0,
		completion: ((Bool) -> Void)? = nil
	) {
		guard let titleLabel else {
			return
		}
		if delay > 0 {
			DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
				UIView.transition(
					with: titleLabel,
					duration: duration,
					options: .transitionCrossDissolve,
					animations: {
						self.setTitle(
							title,
							for: state
						)
					},
					completion: completion
				)
			}
		} else {
			UIView.transition(
				with: titleLabel,
				duration: duration,
				options: .transitionCrossDissolve,
				animations: {
					self.setTitle(
						title,
						for: state
					)
				},
				completion: completion
			)
		}
	}
	
}
