import UIKit

public extension UIBezierPath {
	
	/**
	Returns a path, which is an intersection of the receiver and the argument.
	- Parameter shape: The path, which will be combined with the receiver to find the intersection.
	- Returns: A path, which is an intersection of the receiver and the argument, if it exist.
	Otherwise returns an empty path.
	*/
	func intersection(
		with shape: UIBezierPath
	) -> UIBezierPath {
		addClip()
		
		UIGraphicsGetCurrentContext()?.addPath(shape.cgPath)
		
		guard let intersectionArea = UIGraphicsGetCurrentContext()?.path else {
			return UIBezierPath()
		}
		return UIBezierPath(cgPath: intersectionArea)
	}
	
}
