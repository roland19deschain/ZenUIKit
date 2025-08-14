import UIKit

public extension UINavigationController {
	
	/// Pushes a view controller onto the receiver’s stack and updates the display.
	/// - Parameters:
	///   - viewController: The view controller to push onto the stack.
	///   This object cannot be a tab bar controller. If the view controller is already on the navigation stack,
	///   this method throws an exception.
	///   - animated: Specify _true_ to animate the transition or _false_ if you do not want
	///   the transition to be animated. You might specify _false_ if you are
	///   setting up the navigation controller at launch time.
	///   - completion: The closure to be executed at the end of the animation.
	func push(
		viewController: UIViewController,
		animated: Bool,
		completion: @escaping () -> Void
	) {
		pushViewController(
			viewController,
			animated: animated
		)
		guard animated, let coordinator = transitionCoordinator else {
			DispatchQueue.main.async {
				completion()
			}
			return
		}
		coordinator.animate(alongsideTransition: nil) { _ in
			completion()
		}
	}
	
	/// Pops the top view controller from the navigation stack and updates the display.
	/// - Parameters:
	///   - animated: Set this value to _true_ to animate the transition.
	///   - completion: The closure to be executed at the end of the animation.
	/// - Returns: The view controller that was popped from the stack.
	@discardableResult func popViewController(
		animated: Bool,
		completion: @escaping () -> Void
	) -> UIViewController? {
		CATransaction.begin()
		CATransaction.setCompletionBlock(completion)
		let viewController = popViewController(animated: animated)
		CATransaction.commit()
		return viewController
	}
	
	/// Replaces the view controllers currently managed by the navigation controller
	/// with the specified items.
	/// - Parameters:
	///   - viewControllers: The view controllers to place in the stack.
	///   The front-to-back order of the controllers in this array represents the new bottom-to-top
	///   order of the controllers in the navigation stack. Thus, the last item added to the array
	///   becomes the top item of the navigation stack.
	///   - animated: If true, animate the pushing or popping of the top view controller.
	///   If false, replace the view controllers without any animations.
	///   - completion: The block to execute after the view controller is dismissed.
	///   This block has no return value and takes no parameters.
	func set(
		viewControllers: [UIViewController],
		animated: Bool,
		completion: (() -> Void)?
	) {
		CATransaction.begin()
		CATransaction.setCompletionBlock(completion)
		setViewControllers(
			viewControllers,
			animated: animated
		)
		CATransaction.commit()
	}
	
}
