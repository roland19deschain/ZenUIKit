import UIKit

public extension UIBezierPath {
	
	/// Creates a path from the receiver stroke area, if it exist. Otherwise returns an empty path.
	var strokeArea: UIBezierPath {
		guard let path = CGPath(
			__byStroking: cgPath,
			transform: nil,
			lineWidth: lineWidth,
			lineCap: lineCapStyle,
			lineJoin: lineJoinStyle,
			miterLimit: miterLimit
			) else {
				return UIBezierPath()
		}
		return UIBezierPath(cgPath: path)
	}
	
}
