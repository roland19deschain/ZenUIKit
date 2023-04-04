import UIKit

public extension UILabel {
	
	/// A Boolean value indicating whether the part of text is hidden.
	var isTruncated: Bool {
		guard
			let font,
			let size = text?.size(withAttributes: [.font: font])
		else {
			return false
		}
		return size.width > bounds.size.width
	}
	
}
