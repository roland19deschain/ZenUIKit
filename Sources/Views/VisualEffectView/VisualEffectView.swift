import UIKit

open class VisualEffectView: UIVisualEffectView {
	
	// MARK: - Stored Properties
	
	private let animator: UIViewPropertyAnimator = .init()
	
	// MARK: - Life Cycle
	
	public init() {
		super.init(effect: nil)
	}
	
	public required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	deinit {
		animator.stopAnimation(true)
	}
	
}

// MARK: - Controls

public extension VisualEffectView {
	
	func populate(visualEffect: UIVisualEffect) {
		animator.stopAnimation(true)
		animator.addAnimations { [weak self] in
			guard let self else {
				return
			}
			self.effect = visualEffect
		}
	}
	
	func populate(intensity: CGFloat) {
		animator.fractionComplete = intensity
	}
	
}
