import UIKit

// MARK: - Constraints / Bounds

public extension UIView {
	
	/// Returns a collection of constraints to anchor the bounds
	/// of the receiver to the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: An `NSLayoutConstraint` objects.
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
	/// - Returns: An `NSLayoutConstraint` objects.
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
	/// - Returns: An `NSLayoutConstraint` objects.
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
	/// - Returns: An `NSLayoutConstraint` objects.
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
	/// - Returns: An `NSLayoutConstraint` objects.
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
	/// - Returns: An `NSLayoutConstraint` objects.
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

// MARK: - Constraints / Size

public extension UIView {
	
	/// Returns a collection of constraints that defines a constant size.
	/// - Parameter side: The value to be used for the width and height.
	/// - Returns: An `NSLayoutConstraint` objects.
	func sizeConstraints(_ side: CGFloat) -> [NSLayoutConstraint] {
		[
			widthAnchor.constraint(equalToConstant: side),
			heightAnchor.constraint(equalToConstant: side)
		]
	}
	
	/// Returns a collection of constraints that defines a constant size.
	/// - Parameter size: The constant size of the receiver.
	/// - Returns: An `NSLayoutConstraint` objects.
	func sizeConstraints(_ size: CGSize) -> [NSLayoutConstraint] {
		[
			widthAnchor.constraint(equalToConstant: size.width),
			heightAnchor.constraint(equalToConstant: size.height)
		]
	}
	
}

// MARK: - Constraints / Aspect Ratio

public extension UIView {
	
	/// Returns an aspect ratio constraint (width equals height).
	var aspectRatioConstraint: NSLayoutConstraint {
		aspectRatioConstraint()
	}
	
	/// Returns an aspect ratio constraint (the ratio of its width to its height).
	/// - Parameter ratio: The ratio of its width to its height, default value is 1.
	/// - Returns: An `NSLayoutConstraint` object.
	func aspectRatioConstraint(multiplier: CGFloat = 1) -> NSLayoutConstraint {
		widthAnchor.constraint(
			equalTo: heightAnchor,
			multiplier: multiplier
		)
	}
	
}

// MARK: - Constraints / Center

public extension UIView {
	
	/// Returns a collection of constraints to anchor the center
	/// of the receiver to the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: An `NSLayoutConstraint` objects.
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
	/// - Returns: An `NSLayoutConstraint` objects.
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

// MARK: - Constraints / Enclosed Inside

public extension UIView {
	
	/// Returns a collection of constraints to limit the receivers bounds
	/// to the bounds of the given view.
	/// - Parameter view: The view to anchor to.
	/// - Returns: An `NSLayoutConstraint` objects.
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
	/// - Returns: An `NSLayoutConstraint` objects.
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
	/// - Returns: An `NSLayoutConstraint` objects.
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
	/// - Returns: An `NSLayoutConstraint` objects.
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
	/// - Returns: An `NSLayoutConstraint` objects.
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
	/// - Returns: An `NSLayoutConstraint` objects.
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
