import UIKit

public extension UIViewController {
	
	/**
	 Adds the specified view controller as a child of the receiver,
	 and adds the specified view controller's view to the end of
	 the specified view list of subviews.
	 - parameter viewController: The view controller to be added as a child.
	 - parameter targetView: The view on which `viewController.view` will be placed.
	 */
	func addChild(
		viewController: UIViewController,
		targetView: UIView
	) {
		addChild(viewController)
		viewController.didMove(toParent: self)
		viewController.view.frame = targetView.bounds
		
		viewController
			.view
			.translatesAutoresizingMaskIntoConstraints = false
		
		targetView.addSubview(viewController.view) {
			viewController.view.boundsConstraints(to: targetView)
		}
	}
	
	/**
	 Adds the specified view controller as a child of the receiver,
	 and adds the specified view controller's view to the end of
	 the specified view list of subviews.
	 - parameter viewController: The view controller to be added as a child.
	 - parameter view: The view on which `viewController.view` will be placed.
	 - parameter diration: The total duration of the animations, measured in seconds.
	 - parameter delay: The amount of time (measured in seconds) to wait before beginning the animations.
	 - parameter completion: A block object to be executed when the animation sequence ends.
	 */
	func addChildAnimated(
		viewController: UIViewController,
		targetView: UIView,
		duration: TimeInterval,
		delay: TimeInterval,
		completion: ((Bool) -> Void)? = nil
	) {
		viewController.view.alpha = 0
		
		addChild(
			viewController: viewController,
			targetView: targetView
		)
		
		UIView.animate(
			withDuration: duration,
			delay: delay,
			options: .curveEaseInOut,
			animations: {
				viewController.view.alpha = 1
			},
			completion: completion
		)
	}
	
	/**
	 Removes the view controller from its parent, also unlinks the
	 specified view controller's view from its superview and its window,
	 and removes it from the responder chain.
	 - parameter viewController: The view controller to be removed from parent.
	 */
	func removeChild(viewController: UIViewController) {
		viewController.willMove(toParent: nil)
		viewController.view.removeFromSuperview()
		viewController.removeFromParent()
	}
	
	/**
	 Removes the view controller from its parent, also unlinks the
	 specified view controller's view from its superview and its window,
	 and removes it from the responder chain.
	 - parameter viewController: The view controller to be removed from parent.
	 - parameter diration: The total duration of the animations, measured in seconds.
	 - parameter delay: The amount of time (measured in seconds) to wait before beginning the animations.
	 - parameter completion: A block object to be executed when the animation sequence ends.
	 */
	func removeChildAnimated(
		viewController: UIViewController,
		duration: TimeInterval,
		delay: TimeInterval,
		completion: ((Bool) -> Void)? = nil
	) {
		UIView.animate(
			withDuration: duration,
			delay: delay,
			options: .curveEaseInOut,
			animations: {
				viewController.view.alpha = 0
			},
			completion: { success in
				self.removeChild(viewController: viewController)
				completion?(success)
			}
		)
	}
	
}
