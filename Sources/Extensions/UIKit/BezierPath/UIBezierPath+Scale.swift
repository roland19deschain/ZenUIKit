import UIKit

public extension UIBezierPath {
	
	/**
	Scales the receiver correctly, keeping the center position.
	- Parameter sx: X-axis scale.
	- Parameter sy: Y-axis scale.
	*/
	func scale(
		x scaleX: CGFloat,
		y scaleY: CGFloat
	) {
		let oBox = cgPath.boundingBoxOfPath
		
		apply(
			CGAffineTransform(
				scaleX: scaleX,
				y: scaleY
			)
		)
		
		let sBox = cgPath.boundingBoxOfPath
		
		let tx = -(sBox.origin.x - oBox.origin.x) - (sBox.width - oBox.width) / 2
		let ty = -(sBox.origin.y - oBox.origin.y) - (sBox.height - oBox.height) / 2
		
		apply(
			CGAffineTransform(
				translationX: tx,
				y: ty
			)
		)
	}
	
}
