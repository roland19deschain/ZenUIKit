import UIKit

public class BounceTransitionAnimator: TransitionAnimator {
	
	// MARK: - Stored Properties - Scalars
	
	public let dampingRatio: CGFloat
	
	// MARK: - Life Cycle
	
	public init(
		type: TransitionType = .navigation,
		duration: TimeInterval = 0.5,
		dampingRatio: CGFloat = 0.75
	) {
		self.dampingRatio = dampingRatio
		
		super.init(
			type: type,
			duration: duration
		)
	}
	
}
