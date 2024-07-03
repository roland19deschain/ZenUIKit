import UIKit

public extension UIGraphicsImageRenderer {
	
	convenience init(
		size: CGSize,
		opaque: Bool,
		scale: CGFloat
	) {
		let format = UIGraphicsImageRendererFormat()
		format.scale = scale
		format.opaque = opaque
		self.init(
			size: size,
			format: format
		)
	}
	
	convenience init(
		bounds: CGRect,
		opaque: Bool,
		scale: CGFloat
	) {
		let format = UIGraphicsImageRendererFormat()
		format.scale = scale
		format.opaque = opaque
		self.init(
			bounds: bounds,
			format: format
		)
	}
	
}
