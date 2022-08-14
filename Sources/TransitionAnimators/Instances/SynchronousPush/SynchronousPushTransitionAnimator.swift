import UIKit

public final class SynchronousPushTransitionAnimator: TransitionAnimator {
	
	// MARK: - Life Cycle
	
	public init(duration: TimeInterval = 0.3) {
		super.init(
			type: .navigation,
			duration: duration
		)
	}
	
	// MARK: - UIViewControllerAnimatedTransitioning
	
	public override func animateTransition(
		using transitionContext: UIViewControllerContextTransitioning
	) {
		guard
			let toViewController = transitionContext.viewController(forKey: .to),
			let fromViewController = transitionContext.viewController(forKey: .from)
		else {
			return
		}
		transitionContext.containerView.addSubview(
			toViewController.view
		)
		toViewController.view.center = CGPoint(
			x: fromViewController.view.center.x + fromViewController.view.bounds.width,
			y: fromViewController.view.center.y
		)
		let toCenter: CGPoint = fromViewController.view.center
		let fromCenter: CGPoint = CGPoint(
			x: fromViewController.view.center.x - fromViewController.view.bounds.width,
			y: fromViewController.view.center.y
		)
		
		let animator = UIViewPropertyAnimator(
			duration: duration,
			curve: .easeInOut
		) {
			toViewController.view.center = toCenter
			fromViewController.view.center = fromCenter
		}
		
		animator.addCompletion { position in
			transitionContext.completeTransition(
				!transitionContext.transitionWasCancelled
			)
		}
		
		animator.startAnimation()
	}
	
}
