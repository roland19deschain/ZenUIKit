import UIKit

open class VisualEffectView: UIVisualEffectView {
	
	// MARK: - Stored Properties
	
	private let animator = UIViewPropertyAnimator()
	
	// MARK: - Life Cycle
	
	public init() {
		super.init(effect: nil)
		setup()
	}
	
	public required init?(coder aDecoder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	deinit {
		animator.stopAnimation(true)
	}
	
}

// MARK: - Setup

private extension VisualEffectView {
	
	func setup() {
		animator.pausesOnCompletion = true
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
			effect = visualEffect
		}
	}
	
	func populate(intensity: CGFloat) {
		animator.fractionComplete = intensity
	}
	
}
