import UIKit

// MARK: - Constraints - Bounds

public extension UIView {
	
	/// Returns a collection of constraints to anchor the bounds
	/// of the receiver to the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: An `NSLayoutConstraint` object.
	func boundsConstraints(
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
	
	/// Returns a collection of constraints to anchor the bounds
	/// along the X-axis of the receiver to the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: An `NSLayoutConstraint` object.
	func horizontalBoundsConstraints(
		to view: UIView,
		edgeInset: CGFloat = .zero
	) -> [NSLayoutConstraint] {
		[
			leadingAnchor.constraint(
				equalTo: view.leadingAnchor,
				constant: edgeInset
			),
			view.trailingAnchor.constraint(
				equalTo: trailingAnchor,
				constant: edgeInset
			)
		]
	}
	
	/// Returns a collection of constraints to anchor the bounds
	/// along the Y-axis of the receiver to the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: An `NSLayoutConstraint` object.
	func verticalBoundsConstraints(
		to view: UIView,
		edgeInset: CGFloat = .zero
	) -> [NSLayoutConstraint] {
		[
			topAnchor.constraint(
				equalTo: view.topAnchor,
				constant: edgeInset
			),
			view.bottomAnchor.constraint(
				equalTo: bottomAnchor,
				constant: edgeInset
			)
		]
	}
	
	/// Returns a collection of constraints to anchor the bounds of the receiver
	/// to safe area layout guide of the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: An `NSLayoutConstraint` object.
	func safeAreaConstraints(
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
	
	/// Returns a collection of constraints to anchor the bounds of the receiver
	/// along the X-axis to safe area layout guide of the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: An `NSLayoutConstraint` object.
	func horizontalSafeAreaConstraints(
		to view: UIView,
		edgeInset: CGFloat = .zero
	) -> [NSLayoutConstraint] {
		[
			leadingAnchor.constraint(
				equalTo: view.safeAreaLayoutGuide.leadingAnchor,
				constant: edgeInset
			),
			view.safeAreaLayoutGuide.trailingAnchor.constraint(
				equalTo: trailingAnchor,
				constant: edgeInset
			)
		]
	}
	
	/// Returns a collection of constraints to anchor the bounds of the receiver
	/// along the Y-axis to safe area layout guide of the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: An `NSLayoutConstraint` object.
	func verticalSafeAreaConstraints(
		to view: UIView,
		edgeInset: CGFloat = .zero
	) -> [NSLayoutConstraint] {
		[
			topAnchor.constraint(
				equalTo: view.safeAreaLayoutGuide.topAnchor,
				constant: edgeInset
			),
			view.safeAreaLayoutGuide.bottomAnchor.constraint(
				equalTo: bottomAnchor,
				constant: edgeInset
			)
		]
	}
	
}

// MARK: - Constraints - Size

public extension UIView {
	
	/// Returns a collection of constraints that defines a constant size.
	/// - Parameter size: The constant size of the receiver.
	/// - Returns: An `NSLayoutConstraint` object.
	func sizeConstraints(_ size: CGSize) -> [NSLayoutConstraint] {
		[
			widthAnchor.constraint(equalToConstant: size.width),
			heightAnchor.constraint(equalToConstant: size.height)
		]
	}
	
}

// MARK: - Constraints - Aspect Ratio

public extension UIView {
	
	/// Returns a aspect ratio constraint (the ratio of its width to its height).
	/// - Parameter ratio: The ratio of its width to its height.
	/// - Returns: An `NSLayoutConstraint` object.
	func aspectRatioConstraint(_ multiplier: CGFloat) -> NSLayoutConstraint {
		widthAnchor.constraint(
			equalTo: heightAnchor,
			multiplier: multiplier
		)
	}
	
}

// MARK: - Constraints - Center

public extension UIView {
	
	/// Returns a collection of constraints to anchor the center
	/// of the receiver to the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: An `NSLayoutConstraint` object.
	func centerConstraints(
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
	
	/// Returns a collection of constraints to anchor the center of the receiver
	/// to safe area layout guide center of the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: An `NSLayoutConstraint` object.
	func centerSafeAreaConstraints(
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

// MARK: - Constraints - Enclosed Inside

public extension UIView {
	
	/// Returns a collection of constraints to limit the receivers bounds
	/// to the bounds of the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: An `NSLayoutConstraint` object.
	func enclosedInsideConstraints(
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
	
	/// Returns a collection of constraints to limit the receivers bounds
	/// along the X-axis to the bounds of the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: An `NSLayoutConstraint` object.
	func horizontallyEnclosedInsideConstraints(
		in view: UIView,
		edgeInset: CGFloat = .zero
	) -> [NSLayoutConstraint] {
		[
			leadingAnchor.constraint(
				greaterThanOrEqualTo: view.leadingAnchor,
				constant: edgeInset
			),
			view.trailingAnchor.constraint(
				greaterThanOrEqualTo: trailingAnchor,
				constant: edgeInset
			)
		]
	}
	
	/// Returns a collection of constraints to limit the receivers bounds
	/// along the Y-axis to the bounds of the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: An `NSLayoutConstraint` object.
	func verticallyEnclosedInsideConstraints(
		in view: UIView,
		edgeInset: CGFloat = .zero
	) -> [NSLayoutConstraint] {
		[
			topAnchor.constraint(
				greaterThanOrEqualTo: view.topAnchor,
				constant: edgeInset
			),
			view.bottomAnchor.constraint(
				greaterThanOrEqualTo: bottomAnchor,
				constant: edgeInset
			)
		]
	}
	
	/// Returns a collection of constraints to limit the receivers bounds
	/// to safe area layout guide of the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: An `NSLayoutConstraint` object.
	func enclosedInsideSafeAreaConstraints(
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
	
	/// Returns a collection of constraints to limit the receivers bounds
	/// along the X-axis to safe area layout guide of the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: An `NSLayoutConstraint` object.
	func horizontallyEnclosedInsideSafeAreaConstraints(
		in view: UIView,
		edgeInset: CGFloat = .zero
	) -> [NSLayoutConstraint] {
		[
			leadingAnchor.constraint(
				greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor,
				constant: edgeInset
			),
			view.safeAreaLayoutGuide.trailingAnchor.constraint(
				greaterThanOrEqualTo: trailingAnchor,
				constant: edgeInset
			)
		]
	}
	
	/// Returns a collection of constraints to limit the receivers bounds
	/// along the Y-axis to safe area layout guide of the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: An `NSLayoutConstraint` object.
	func verticallyEnclosedInsideSafeAreaConstraints(
		in view: UIView,
		edgeInset: CGFloat = .zero
	) -> [NSLayoutConstraint] {
		[
			topAnchor.constraint(
				greaterThanOrEqualTo: view.safeAreaLayoutGuide.topAnchor,
				constant: edgeInset
			),
			view.safeAreaLayoutGuide.bottomAnchor.constraint(
				greaterThanOrEqualTo: bottomAnchor,
				constant: edgeInset
			)
		]
	}
	
}
