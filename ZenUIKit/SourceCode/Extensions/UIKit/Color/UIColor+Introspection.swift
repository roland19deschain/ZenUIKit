import UIKit

public extension UIColor {
	
	/// Returns a _CIColor_ created using the receiver.
	var coreImageColor: CIColor {
		CIColor(color: self)
	}
	
	/// Returns a tuple with the unpremultiplied components of the color (red, green, blue) and alpha.
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
	
	/// Returns the color as hexadecimal number.
	var hex: Int {
		var red: CGFloat = 0
		var green: CGFloat = 0
		var blue: CGFloat = 0
		var alpha: CGFloat = 0
		
		getRed(
			&red,
			green: &green,
			blue: &blue,
			alpha: &alpha
		)
		return Int(red * 255) << 16
			| Int(green * 255) << 8
			| Int(blue * 255) << 0
	}
	
	/// Returns the color as string with hexadecimal number.
	var hexString: String  {
		String(format: "%06x", hex).uppercased()
	}
	
}
