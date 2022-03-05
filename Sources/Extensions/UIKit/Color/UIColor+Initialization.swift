import UIKit
import ZenSwift

public extension UIColor {
	
	/**
	Creates a color object using the specified opacity and string with hexadecimal number.
	- parameter hex: The string with hexadecimal number to build color.
	- parameter alpha: The opacity value of the color object, specified as a value from 0.0 to 1.0.
	Alpha values below 0.0 are interpreted as 0.0, and values above 1.0 are interpreted as 1.0.
	- returns: The color object or _nil_ if it is impossible to extract a number from a string.
	*/
	convenience init?(
		hex string: String,
		alpha: CGFloat = 1
	) {
		guard let hex: Int = string.hex else {
			return nil
		}
		self.init(
			hex: hex,
			alpha: alpha
		)
	}
	
	/**
	Creates a color object using the specified opacity and hexadecimal number.
	- parameter hex: The hexadecimal number to build color.
	- parameter alpha: The opacity value of the color object, specified as a value from 0.0 to 1.0.
	Alpha values below 0.0 are interpreted as 0.0, and values above 1.0 are interpreted as 1.0.
	- returns: The color object.
	*/
	convenience init(
		hex: Int,
		alpha: CGFloat = 1
	) {
		self.init(
			red: CGFloat((hex & 0xFF0000) >> 16) / CGFloat(0xFF),
			green: CGFloat((hex & 0x00FF00) >>  8) / CGFloat(0xFF),
			blue:  CGFloat((hex & 0x0000FF) >>  0) / CGFloat(0xFF),
			alpha: alpha
		)
	}
	
}
