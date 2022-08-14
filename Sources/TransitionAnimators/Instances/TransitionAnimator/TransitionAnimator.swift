import UIKit

public class TransitionAnimator: NSObject {
	
	// MARK: - Stored Properties
	
	let type: TransitionType
	let duration: TimeInterval
	
	// MARK: - Life Cycle
	
	public init(
		type: TransitionType = .navigation,
		duration: TimeInterval = 0.5
	) {
		self.type = type
		self.duration = duration
		
		super.init()
	}
	
}

// MARK: - UIViewControllerAnimatedTransitioning

extension TransitionAnimator: UIViewControllerAnimatedTransitioning {
	
	public func transitionDuration(
		using transitionContext: UIViewControllerContextTransitioning?
	) -> TimeInterval {
		duration
	}
	
	public func animateTransition(
		using transitionContext: UIViewControllerContextTransitioning
	) {}
	
}
