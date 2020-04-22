import UIKit

public extension UIColor {
	
	/// Returns a _CIColor_ created using the receiver.
	var coreImageColor: CIColor {
		CIColor(color: self)
	}
	
	/// Return a tuple with the unpremultiplied components of the color (red, green, blue) and alpha.
	var components: (
		red: CGFloat,
		green: CGFloat,
		blue: CGFloat,
		alpha: CGFloat
		) {
		let ciColor = coreImageColor
		
		return (
			ciColor.red,
			ciColor.green,
			ciColor.blue,
			ciColor.alpha
		)
	}
	
}
