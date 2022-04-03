import UIKit

public final class PresentFadeAnimator: TransitionAnimator {
	
	public override func animateTransition(
		using transitionContext: UIViewControllerContextTransitioning
	) {
		guard let toViewController = transitionContext.viewController(forKey: .to) else {
			return
		}
		transitionContext.containerView.addSubview(
			toViewController.view
		)
		toViewController.view.alpha = 0
		
		let animator = UIViewPropertyAnimator(
			duration: duration,
			dampingRatio: dampingRatio
		) {
			toViewController.view.alpha = 1
		}
		animator.addCompletion { position in
			transitionContext.completeTransition(
				!transitionContext.transitionWasCancelled
			)
		}
		animator.startAnimation()
	}
	
}
