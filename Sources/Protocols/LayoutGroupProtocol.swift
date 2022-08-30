import UIKit

public protocol LayoutGroupProtocol {

	var constraints: [NSLayoutConstraint] { get }

}

extension NSLayoutConstraint: LayoutGroupProtocol {

	public var constraints: [NSLayoutConstraint] {
		[self]
	}
}

extension Array: LayoutGroupProtocol where Element == NSLayoutConstraint {

	public var constraints: [NSLayoutConstraint] {
		self
	}

}
