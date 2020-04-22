import UIKit

public extension UIImage {
	
	/// A Boolean value indicating whether the image has an alpha channel.
	var hasAlpha: Bool {
		guard let alpha = cgImage?.alphaInfo else {
			return false
		}
		switch alpha {
		case .none, .noneSkipFirst, .noneSkipLast:
			return false
		default:
			return true
		}
	}
	
}
