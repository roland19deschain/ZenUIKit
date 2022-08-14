import UIKit

public final class ScaleTransformPresentTransitionAnimator: BounceTransitionAnimator {
	
	// MARK: - Stored Properties - References
	
	private let transitionStartingPointProvider: TransitionStartingPointProviderProtocol
	
	// MARK: - Life Cycle
	
	public init(
		transitionStartingPointProvider: TransitionStartingPointProviderProtocol,
		type: TransitionType = .navigation,
		duration: TimeInterval = 0.5,
		dampingRatio: CGFloat = 0.75
	) {
		self.transitionStartingPointProvider = transitionStartingPointProvider
		
		super.init(
			type: type,
			duration: duration,
			dampingRatio: dampingRatio
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
		
		transitionContext.containerView.addSubview(toViewController.view)
		
		toViewController.view.transform = CGAffineTransform(
			scaleX: 0,
			y: 0
		)
		
		toViewController.view.center = transitionStartingPointProvider
			.transitionStartingPoint(
				for: toViewController
			)
		
		let animator = UIViewPropertyAnimator(
			duration: duration,
			dampingRatio: dampingRatio
		) {
			toViewController.view.transform = .identity
			toViewController.view.center = fromViewController.view.center
		}
		
		animator.addCompletion { position in
			transitionContext.completeTransition(
				!transitionContext.transitionWasCancelled
			)
		}
		
		animator.startAnimation()
	}
	
}
