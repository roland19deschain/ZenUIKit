import UIKit

public extension UIImage {
	
	/**
	Creates a new image based on the receiver and rotate it to the specified angle.
	- parameter radians: The image rotation angle (in radians).
	- returns: The image based on the receiver, rotated by a specified angle
	*/
	func rotated(to radians: CGFloat) -> UIImage {
		guard let cgImage = cgImage else {
			return self
		}
		
		let newSide: CGFloat = max(size.width, size.height)
		let newSize: CGSize = CGSize(
			width: newSide,
			height: newSide
		)
		
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
			x: newSide / 2,
			y: newSide / 2
		)
		context.rotate(by: radians)
		
		let rect = CGRect(
			x: -(size.width / 2),
			y: -(size.height / 2),
			width: size.width,
			height: size.height
		)
		
		context.draw(
			cgImage,
			in: rect
		)
		
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
