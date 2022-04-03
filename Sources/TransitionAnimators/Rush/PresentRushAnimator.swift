import UIKit

public final class PresentRushAnimator: TransitionAnimator {
	
	// MARK: - Stored Properties
	
	private let transitionStartingPointProvider: TransitionStartingPointProviderProtocol
	
	// MARK: - Life Cycle
	
	public init(
		transitionStartingPointProvider: TransitionStartingPointProviderProtocol,
		type: TransitionType = Default.type,
		duration: TimeInterval = Default.duration,
		dampingRatio: CGFloat = Default.dampingRatio
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
