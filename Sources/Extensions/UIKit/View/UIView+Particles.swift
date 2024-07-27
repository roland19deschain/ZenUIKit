import UIKit

public extension UIView {
	
	/// Run animated particles on the receiver, that resemble falling snowflakes.
	/// - Parameters:
	///   - image: An image used as particle body.
	///   - colors: Variety of colors for particles (the more colors, the denser the particles will be).
	func displaySnowflakeStyleParticles(
		image: UIImage? = nil,
		colors: [UIColor]? = nil
	) {
		let image: UIImage = image ?? ImageGenerator().radialGradientImage(
			size: CGSize(width: 12, height: 12),
			outerColor: .white.withAlphaComponent(0),
			innerColor: .white
		)
		let colors: [UIColor] = colors ?? Array(0...9).map { _ -> UIColor in
				.white
		}
		guard let contentImage = image.cgImage else {
			return
		}
		let particleEmitter = CAEmitterLayer()
		particleEmitter.emitterPosition = CGPoint(x: -bounds.width, y: 0)
		particleEmitter.emitterShape = .line
		particleEmitter.emitterMode = .outline
		particleEmitter.emitterSize = CGSize(width: bounds.width * 2, height: 1)
		particleEmitter.emitterCells = []
		particleEmitter.shadowColor = UIColor.black.cgColor
		particleEmitter.shadowOffset = CGSize(width: 4, height: 4)
		colors.forEach {
			let cell = CAEmitterCell()
			cell.birthRate = 1
			cell.lifetime = 20
			cell.lifetimeRange = 0
			cell.velocity = 180
			cell.velocityRange = 10
			cell.emissionLongitude = .pi / 1.3
			cell.emissionRange = .pi / 6
			cell.spin = 2
			cell.spinRange = 1
			cell.scale = 0.3
			cell.scaleRange = 0.2
			cell.alphaSpeed = UIDevice.current.userInterfaceIdiom == .pad ? -0.05 : -0.1
			cell.alphaRange = 1
			cell.contents = contentImage
			cell.color = $0.cgColor
			particleEmitter.emitterCells?.append(cell)
		}
		layer.addSublayer(particleEmitter)
	}
	
}
