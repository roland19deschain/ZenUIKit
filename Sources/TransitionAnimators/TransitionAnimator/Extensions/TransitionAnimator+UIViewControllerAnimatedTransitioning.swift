import UIKit

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
