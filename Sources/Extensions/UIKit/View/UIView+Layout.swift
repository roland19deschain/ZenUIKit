import UIKit

// MARK: - Anchors - Bounds

public extension UIView {
	
	/// Returns a collection of constraints to anchor the bounds of the receiver to the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: The layout constraints needed for this constraint.
	func boundsAnchors(
		to view: UIView,
		edgeInsets: UIEdgeInsets = .zero
	) -> [NSLayoutConstraint] {
		[
			leadingAnchor.constraint(
				equalTo: view.leadingAnchor,
				constant: edgeInsets.left
			),
			view.trailingAnchor.constraint(
				equalTo: trailingAnchor,
				constant: edgeInsets.right
			),
			topAnchor.constraint(
				equalTo: view.topAnchor,
				constant: edgeInsets.top
			),
			view.bottomAnchor.constraint(
				equalTo: bottomAnchor,
				constant: edgeInsets.bottom
			)
		]
	}
	
	/// Returns a collection of constraints to restrict the bounds of the receiver inside the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: The layout constraints needed for this constraint.
	func withinAnchors(
		to view: UIView,
		edgeInsets: UIEdgeInsets = .zero
	) -> [NSLayoutConstraint] {
		[
			leadingAnchor.constraint(
				greaterThanOrEqualTo: view.leadingAnchor,
				constant: edgeInsets.left
			),
			view.trailingAnchor.constraint(
				greaterThanOrEqualTo: trailingAnchor,
				constant: edgeInsets.right
			),
			topAnchor.constraint(
				greaterThanOrEqualTo: view.topAnchor,
				constant: edgeInsets.top
			),
			view.bottomAnchor.constraint(
				greaterThanOrEqualTo: bottomAnchor,
				constant: edgeInsets.bottom
			)
		]
	}
	
	/// Returns a collection of constraints to anchor the bounds of the receiver to safe area layout guide of the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: The layout constraints needed for this constraint.
	func safeAreaAnchors(
		to view: UIView,
		edgeInsets: UIEdgeInsets = .zero
	) -> [NSLayoutConstraint] {
		[
			leadingAnchor.constraint(
				equalTo: view.safeAreaLayoutGuide.leadingAnchor,
				constant: edgeInsets.left
			),
			view.safeAreaLayoutGuide.trailingAnchor.constraint(
				equalTo: trailingAnchor,
				constant: edgeInsets.right
			),
			topAnchor.constraint(
				equalTo: view.safeAreaLayoutGuide.topAnchor,
				constant: edgeInsets.top
			),
			view.safeAreaLayoutGuide.bottomAnchor.constraint(
				equalTo: bottomAnchor,
				constant: edgeInsets.bottom
			)
		]
	}
	
}

// MARK: - Anchors - Center

public extension UIView {
	
	/// Returns a collection of constraints to anchor the center of the receiver to the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: The layout constraints needed for this constraint.
	func centerAnchors(
		to view: UIView,
		offset: CGPoint = .zero
	) -> [NSLayoutConstraint] {
		[
			centerXAnchor.constraint(
				equalTo: view.centerXAnchor,
				constant: offset.x
			),
			centerYAnchor.constraint(
				equalTo: view.centerYAnchor,
				constant: offset.y
			)
		]
	}
	
	/// Returns a collection of constraints to anchor the center of the receiver to safe area layout guide center of the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: The layout constraints needed for this constraint.
	func centerSafeAreaAnchors(
		to view: UIView,
		offset: CGPoint = .zero
	) -> [NSLayoutConstraint] {
		[
			centerXAnchor.constraint(
				equalTo: view.safeAreaLayoutGuide.centerXAnchor,
				constant: offset.x
			),
			centerYAnchor.constraint(
				equalTo: view.safeAreaLayoutGuide.centerYAnchor,
				constant: offset.y
			)
		]
	}
	
}

// MARK: - Anchors - Enclosed Inside

public extension UIView {
	
	/// Returns a collection of constraints to limit the receivers bounds to the bounds of the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: The layout constraints needed for this constraint.
	func enclosedInsideAnchors(
		in view: UIView,
		edgeInsets: UIEdgeInsets = .zero
	) -> [NSLayoutConstraint] {
		[
			leadingAnchor.constraint(
				greaterThanOrEqualTo: view.leadingAnchor,
				constant: edgeInsets.left
			),
			view.trailingAnchor.constraint(
				greaterThanOrEqualTo: trailingAnchor,
				constant: edgeInsets.right
			),
			topAnchor.constraint(
				greaterThanOrEqualTo: view.topAnchor,
				constant: edgeInsets.top
			),
			view.bottomAnchor.constraint(
				greaterThanOrEqualTo: bottomAnchor,
				constant: edgeInsets.bottom
			)
		]
	}
	
	/// Returns a collection of constraints to limit the receivers bounds to safe area layout guide of the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: The layout constraints needed for this constraint.
	func enclosedInsideSafeAreaAnchors(
		in view: UIView,
		edgeInsets: UIEdgeInsets = .zero
	) -> [NSLayoutConstraint] {
		[
			leadingAnchor.constraint(
				greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor,
				constant: edgeInsets.left
			),
			view.safeAreaLayoutGuide.trailingAnchor.constraint(
				greaterThanOrEqualTo: trailingAnchor,
				constant: edgeInsets.right
			),
			topAnchor.constraint(
				greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor,
				constant: edgeInsets.top
			),
			view.safeAreaLayoutGuide.bottomAnchor.constraint(
				greaterThanOrEqualTo: bottomAnchor,
				constant: edgeInsets.bottom
			)
		]
	}
	
}
