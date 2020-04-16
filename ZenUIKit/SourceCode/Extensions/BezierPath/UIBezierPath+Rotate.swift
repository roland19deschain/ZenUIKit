import UIKit

public extension UIBezierPath {
	
	/**
	Rotate the receiver correctly, keeping the center position.
	- Parameter rotate: The angle, in radians.
	*/
	func rotate(to angle: CGFloat) {
		let oBox = cgPath.boundingBoxOfPath
		
		apply(
			CGAffineTransform(rotationAngle: angle)
		)
		
		let rBox = cgPath.boundingBoxOfPath
		let tx = -(rBox.origin.x - oBox.origin.x) - (rBox.width - oBox.width) / 2
		let ty = -(rBox.origin.y - oBox.origin.y) - (rBox.height - oBox.height) / 2
		
		apply(
			CGAffineTransform(
				translationX: tx,
				y: ty
			)
		)
	}
	
}
