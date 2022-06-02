import UIKit

open class AxialGradientView: UIView {

	// MARK: - Nested Types

	public enum Direction {
		case left
		case right
		case up
		case down
	}

	// MARK: - Computed Properties - Overridden

	open override class var layerClass: AnyClass {
		CAGradientLayer.self
	}

	// MARK: - Computed Properties - Layers

	private var gradientLayer: CAGradientLayer? {
		layer as? CAGradientLayer
	}

	// MARK: - Stored Properties - Values

	public var startPoint: CGPoint = .zero {
		didSet {
			gradientLayer?.startPoint = startPoint
		}
	}

	public var endPoint: CGPoint = .zero {
		didSet {
			gradientLayer?.endPoint = endPoint
		}
	}

	public var direction: Direction = .up {
		didSet {
			updateDirection()
		}
	}

	public var colors: [UIColor] = [] {
		didSet {
			updateColors()
		}
	}

	public var locations: [NSNumber] = [0, 0.5, 1] {
		didSet {
			updateLocations()
		}
	}

	// MARK: - Stored Properties - Overridden

	public  override var bounds: CGRect {
		didSet {
			updateFrame()
		}
	}

}

// MARK: - Update Gradient

private extension AxialGradientView {

	func updateDirection() {
		startPoint = startPoint(direction)
		endPoint = endPoint(direction)

		gradientLayer?.startPoint = startPoint
		gradientLayer?.endPoint = endPoint
	}

	func updateColors() {
		gradientLayer?.colors = colors.map {
			$0.cgColor
		}
	}

	func updateLocations() {
		gradientLayer?.locations = locations
	}

	func updateFrame() {
		gradientLayer?.frame = bounds
	}

}

// MARK: - Direction Points

private extension AxialGradientView {

	func startPoint(_ direction: Direction) -> CGPoint {
		switch direction {
		case .left:		return CGPoint(x: 1, y: 0)
		case .right:	return CGPoint(x: 0, y: 0)
		case .up:		return CGPoint(x: 0, y: 1)
		case .down:		return CGPoint(x: 0, y: 0)
		}
	}

	func endPoint(_ direction: Direction) -> CGPoint {
		switch direction {
		case .left:		return CGPoint(x: 0, y: 0)
		case .right:	return CGPoint(x: 1, y: 0)
		case .up:		return CGPoint(x: 0, y: 0)
		case .down:		return CGPoint(x: 0, y: 1)
		}
	}

}
