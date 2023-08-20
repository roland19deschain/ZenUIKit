import UIKit

public extension UIColor {
	
	func linearInterpolation(
		to color: UIColor,
		percentage: Double
	) -> UIColor {
		var r0: CGFloat = 0
		var g0: CGFloat = 0
		var b0: CGFloat = 0
		var a0: CGFloat = 0
		getRed(&r0, green: &g0, blue: &b0, alpha: &a0)
		
		var r2: CGFloat = 0
		var g2: CGFloat = 0
		var b2: CGFloat = 0
		var a2: CGFloat = 0
		color.getRed(&r2, green: &g2, blue: &b2, alpha: &a2)
		
		return UIColor(
			red: r0 + (r2 - r0) * percentage,
			green: g0 + (g2 - g0) * percentage,
			blue: b0 + (b2 - b0) * percentage,
			alpha: a0 + (a2 - a0) * percentage
		)
	}
	
}
