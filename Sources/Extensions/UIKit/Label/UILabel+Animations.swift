import UIKit

public extension UILabel {
	
	func animateTextColor(
		duration: TimeInterval = 0.3,
		delay: TimeInterval = 0,
		newColor: UIColor,
		completion: ((Bool) -> Void)? = nil
	) {
		DispatchQueue.main.asyncAfter(deadline: .now() + delay) {
			UIView.transition(
				with: self,
				duration: duration,
				options: .transitionCrossDissolve,
				animations: { self.textColor = newColor },
				completion: completion
			)
		}
	}
	
}
