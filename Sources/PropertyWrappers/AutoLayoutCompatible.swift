import UIKit

@propertyWrapper public struct AutoLayoutCompatible<T: UIView> {

	public var wrappedValue: T {
		didSet {
			wrappedValue.translatesAutoresizingMaskIntoConstraints = false
		}
	}

	public init(wrappedValue: T) {
		self.wrappedValue = wrappedValue
		wrappedValue.translatesAutoresizingMaskIntoConstraints = false
	}

}
