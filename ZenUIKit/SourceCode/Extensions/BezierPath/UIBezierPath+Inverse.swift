import UIKit

public extension UIBezierPath {
	
	/// Options for building an inverse _UIBezierPath_.
	enum InverseOption {
		case infiniteSurroundings
		case boundingBoxWithControlPoints
		case smallestBoundingBox
	}
	
	/**
	Turns the receiver inside out, in accordance with the specified options.
	- parameter option: An option to build a inverse path.
	- returns: An inverse path.
	*/
	func inverse(with option: InverseOption) -> UIBezierPath {
		var rect: CGRect = .zero
		
		switch option {
		case .infiniteSurroundings:			rect = .infinite
		case .boundingBoxWithControlPoints:	rect = cgPath.boundingBox
		case .smallestBoundingBox:			rect = cgPath.boundingBoxOfPath
		}
		
		let path = UIBezierPath(rect: rect)
		path.append(self)
		path.usesEvenOddFillRule = true
		
		return path
	}
	
}
