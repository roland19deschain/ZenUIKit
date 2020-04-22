import CoreGraphics

public extension Int {
	
	/// Returns receiver value converted to radians.
	var radians: CGFloat {
		CGFloat(self) * .pi / 180
	}
	
	/// Returns receiver value converted to degrees.
	var degrees: CGFloat {
		CGFloat(self) * 180 / .pi
	}
	
}
