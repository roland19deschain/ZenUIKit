import UIKit

public extension UIBezierPath {
	
	/**
	Returns a compound path, except the intersection area.
	- Parameter shape: The path that will be combined with the receiver.
	- Returns: A compound path, except the intersection area.
	*/
	func excludeOverlap(
		with shape: UIBezierPath
	) -> UIBezierPath {
		let path = UIBezierPath(cgPath: cgPath)
		
		path.append(shape)
		path.usesEvenOddFillRule = true
		
		return path
	}
	
}
