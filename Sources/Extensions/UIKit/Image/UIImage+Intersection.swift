import UIKit

public extension UIImage {
	
	/// A Boolean value indicating whether the image has an alpha channel.
	var hasAlphaChannel: Bool {
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
