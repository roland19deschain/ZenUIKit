import UIKit

public extension UIBezierPath {
	
	/**
	Adds an arrow to the path pointing from the start point to the end point.
	- Parameter start: Arrow start point.
	- Parameter end: Arrow end point.
	- Parameter lineLength: Length of pointer lines.
	- Parameter angle: Arrow angle.
	*/
	func addArrow(
		start: CGPoint,
		end: CGPoint,
		lineLength: CGFloat,
		angle: CGFloat
	) {
		move(to: start)
		addLine(to: end)
		
		let startEndAngle: CGFloat = atan((end.y - start.y) / (end.x - start.x))
			+ ((end.x - start.x) < 0 ? .pi : 0)
		
		let firstLineEnd = CGPoint(
			x: end.x + lineLength * cos(.pi - startEndAngle + angle),
			y: end.y - lineLength * sin(.pi - startEndAngle + angle)
		)
		let secondLineEnd = CGPoint(
			x: end.x + lineLength * cos(.pi - startEndAngle - angle),
			y: end.y - lineLength * sin(.pi - startEndAngle - angle)
		)
		
		addLine(to: firstLineEnd)
		move(to: end)
		addLine(to: secondLineEnd)
	}
	
}
