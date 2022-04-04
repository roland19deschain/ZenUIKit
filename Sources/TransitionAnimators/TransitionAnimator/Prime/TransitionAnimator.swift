import UIKit

public class TransitionAnimator: NSObject {
	
	// MARK: - Stored Properties
	
	let type: TransitionType
	let duration: TimeInterval
	let dampingRatio: CGFloat
	
	// MARK: - Life Cycle
	
	public init(
		type: TransitionType = Default.type,
		duration: TimeInterval = Default.duration,
		dampingRatio: CGFloat = Default.dampingRatio
	) {
		self.type = type
		self.duration = duration
		self.dampingRatio = dampingRatio
		
		super.init()
	}
	
}
