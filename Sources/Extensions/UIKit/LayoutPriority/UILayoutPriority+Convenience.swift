import UIKit

public extension UILayoutPriority {

	/// Creates a priority which is almost required, but not 100%.
	static var almostRequired: UILayoutPriority {
		UILayoutPriority(rawValue: 999)
	}

	/// Creates a priority which is not required at all.
	static var notRequired: UILayoutPriority {
		UILayoutPriority(rawValue: 0)
	}

}
