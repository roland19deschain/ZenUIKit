import UIKit

public struct ImageGenerator {
	
	// MARK: - Life Cycle
	
	public init() {}
	
}

// MARK: - Image Generation

public extension ImageGenerator {
	
	/// Generates an image with a radial gradient.
	/// - Parameters:
	///   - size: Size of a image.
	///   - outerColor: Radial gradient outer color (can be transparent).
	///   - innerColor: Radial gradient outer color (can be transparent).
	/// - Returns: The generated image, with a radial gradient inside.
	func radialGradientImage(
		size: CGSize,
		outerColor: UIColor,
		innerColor: UIColor
	) -> UIImage {
		guard let gradient = CGGradient(
			colorsSpace: CGColorSpaceCreateDeviceRGB(),
			colors: [outerColor.cgColor, innerColor.cgColor] as CFArray,
			locations: [1, 0]
		) else {
			return UIImage()
		}
		let center = CGPoint(x: size.width / 2, y: size.height / 2)
		return UIGraphicsImageRenderer(
			size: size,
			opaque: false,
			scale: UIScreen.main.scale
		).image { context in
			context.cgContext.drawRadialGradient(
				gradient,
				startCenter: center,
				startRadius: 0,
				endCenter: center,
				endRadius: size.width / 2,
				options: .drawsAfterEndLocation
			)
		}
	}
	
}
