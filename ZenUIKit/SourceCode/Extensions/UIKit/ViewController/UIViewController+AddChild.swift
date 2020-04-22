import UIKit

public extension UIViewController {
	
	/**
	Adds the specified view controller as a child of the receiver,
	and adds the specified view controller's view to the end of
	the specified view list of subviews.
	- parameter childViewController: The view controller to be added as a child.
	- parameter view: The view on which _childViewController.view_ will be placed.
	*/
	func add(
		_ childViewController: UIViewController,
		to view: UIView
	) {
		addChild(childViewController)
		childViewController.didMove(toParent: self)
		childViewController.view.frame = view.bounds
		view.addSubview(childViewController.view)
		
		childViewController
			.view
			.translatesAutoresizingMaskIntoConstraints = false
		
		NSLayoutConstraint.activate([
			childViewController.view.leadingAnchor.constraint(
					equalTo: view.leadingAnchor
			),
			childViewController.view.trailingAnchor.constraint(
				equalTo: view.trailingAnchor
			),
			childViewController.view.topAnchor.constraint(
				equalTo: view.topAnchor
			),
			childViewController.view.bottomAnchor.constraint(
				equalTo: view.bottomAnchor
			)
		])
	}
	
	/**
	Removes the view controller from its parent, also unlinks the
	specified view controller's view from its superview and its window,
	and removes it from the responder chain.
	- parameter childViewController: The view controller to be removed from parent.
	*/
	func remove(_ childViewController: UIViewController) {
		childViewController.willMove(toParent: nil)
		childViewController.view.removeFromSuperview()
		childViewController.removeFromParent()
	}
	
}

