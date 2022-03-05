import UIKit

public extension UIColor {
	
	/// Returns an opaque color (alpha 1) with random RGB values.
	static var opaqueRandom: UIColor {
		UIColor(
			red: .random(in: 0...1),
			green: .random(in: 0...1),
			blue: .random(in: 0...1),
			alpha: 1
		)
	}
	
	/// Return a color with random RGB and alpha values.
	static var transparenteRandom: UIColor {
		UIColor(
			red: .random(in: 0...1),
			green: .random(in: 0...1),
			blue: .random(in: 0...1),
			alpha: .random(in: 0...1)
		)
	}
	
}
