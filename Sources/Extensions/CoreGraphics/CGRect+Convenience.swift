import UIKit

public extension CGRect {

	/// Returns a string formatted to contain the data from a rectangle.
	var stringRepresentation: String {
		NSCoder.string(for: self)
	}
	
}
