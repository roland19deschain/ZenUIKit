import UIKit

public extension UIImage {
	
	/**
	Creates a new image based on the receiver and rotate it to the specified angle.
	- parameter radians: The image rotation angle (in radians).
	- returns: The image based on the receiver, rotated by a specified angle
	*/
	func rotated(to radians: CGFloat) -> UIImage {
		let rotationTransform = CGAffineTransform(rotationAngle: radians)
		var newSize = CGRect(
			origin: .zero,
			size: size
		).applying(rotationTransform).size
		
		// Trim off the extremely small float value
		// to prevent core graphics from rounding it up.
		newSize.width = floor(newSize.width)
		newSize.height = floor(newSize.height)

		UIGraphicsBeginImageContextWithOptions(
			newSize,
			false,
			scale
		)
		
		defer {
			UIGraphicsEndImageContext()
		}
		guard let context = UIGraphicsGetCurrentContext() else {
			return self
		}
		context.translateBy(
			x: newSize.width / 2,
			y: newSize.height / 2
		)
		context.rotate(by: radians)
		
		let drawRect = CGRect(
			x: -size.width / 2,
			y: -size.height / 2,
			width: size.width,
			height: size.height
		)
		draw(in: drawRect)
		
		return UIGraphicsGetImageFromCurrentImageContext() ?? self
	}
	
	/**
	Creates a picture based on the receiver and rotate it in the direction of orientation.
	- parameter orientation: The orientation for image rotation.
	- returns: The image based on the receiver, rotated it in the direction of orientation.
	*/
	func rotated(to orientation: Orientation) -> UIImage {
		UIGraphicsBeginImageContextWithOptions(
			size,
			false,
			scale
		)
		
		defer {
			UIGraphicsEndImageContext()
		}
		
		guard let context = UIGraphicsGetCurrentContext() else {
			return self
		}
		
		switch orientation {
		case .left:		context.rotate(by: -90.radians)
		case .right:	context.rotate(by: 90.radians)
		case .up:		break
		case .down:		context.rotate(by: 90.radians)
		default:		break
		}
		
		draw(at: .zero)
		
		return UIGraphicsGetImageFromCurrentImageContext() ?? self
	}
	
}
