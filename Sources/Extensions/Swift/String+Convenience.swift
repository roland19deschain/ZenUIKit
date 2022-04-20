import UIKit

public extension String {
	
	/// Returns a Core Graphics rectangle structure corresponding to the data in a given string.
	var cgRectRepresentation: CGRect {
		NSCoder.cgRect(for: self)
	}
	
}
