import UIKit

public final class DismissFadeAnimator: TransitionAnimator {
	
	public override func animateTransition(
		using transitionContext: UIViewControllerContextTransitioning
	) {
		guard let fromViewController = transitionContext.viewController(forKey: .from) else {
			return
		}
		
		if
			type == .navigation,
			let toViewController = transitionContext.viewController(forKey: .to)
		{
			transitionContext.containerView.insertSubview(
				toViewController.view,
				belowSubview: fromViewController.view
			)
		}
		
		let animator = UIViewPropertyAnimator(
			duration: duration,
			dampingRatio: dampingRatio
		) {
			fromViewController.view.alpha = 0
		}
		animator.addCompletion { position in
			transitionContext.completeTransition(
				!transitionContext.transitionWasCancelled
			)
		}
		animator.startAnimation()
	}
	
}
