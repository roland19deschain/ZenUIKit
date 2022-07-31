import UIKit

public extension UISwitch {
	
	/// The color used to tint the appearance of the switch when it’s in the off position.
	var offTintColor: UIColor {
		set {
			subviews.first?.subviews.first?.backgroundColor = newValue
		}
		get {
			subviews.first?.subviews.first?.backgroundColor ?? .clear
		}
	}
	
}
