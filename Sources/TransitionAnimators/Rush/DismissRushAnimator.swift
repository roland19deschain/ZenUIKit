import UIKit
import ZenCoreGraphics

public final class DismissRushAnimator: TransitionAnimator {
	
	// MARK: - Stored Properties
	
	private let transitionEndPointProvider: TransitionEndPointProviderProtocol
	
	// MARK: - Life Cycle
	
	public init(
		transitionEndPointProvider: TransitionEndPointProviderProtocol,
		type: TransitionType = Default.type,
		duration: TimeInterval = Default.duration,
		dampingRatio: CGFloat = Default.dampingRatio
	) {
		self.transitionEndPointProvider = transitionEndPointProvider
		
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
		guard let fromViewController = transitionContext.viewController(
			forKey: .from
		) else {
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
		
		let position = transitionEndPointProvider.transitionEndPoint(
			for: fromViewController
		)
		
		let animator = UIViewPropertyAnimator(
			duration: duration,
			dampingRatio: dampingRatio
		) {
			fromViewController.view.center = position
			fromViewController.view.transform = .smallestScaleXAndY
		}
		
		animator.addCompletion { position in
			transitionContext.completeTransition(
				!transitionContext.transitionWasCancelled
			)
		}
		
		animator.startAnimation()
	}
	
}
