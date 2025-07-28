import UIKit

/// A view wrapper that prevents its contents from being captured in screenshots or screen recordings.
/// Wraps the provided view hierarchy in a secure layer that obscures its contents from iOS's screenshot mechanisms.
/// The view will appear normally to users but won't be visible in screenshots or recordings.
public final class SecureView: UIView {
	
	// MARK: - Stored Properties / Views
	
	public let canvasView: UIView
	public let protectedView: UIView

	// MARK: - Life Cycle
	
	/// A view wrapper that prevents its contents from being captured in screenshots or screen recordings.
	/// - Parameter protectedView: The view hierarchy to protect from screenshot capture.
	/// - Returns: `SecureView` instance if protection can be applied, and `nil` if the
	/// behavior of the `UITextField` was changed by Apple and the approach is no longer availabe.
	public init?(_ protectedView: UIView) {
		let textField = UITextField()
		textField.isSecureTextEntry = true
		guard let canvasView = textField.layer.sublayers?.first?.delegate as? UIView else {
			return nil
		}
		self.canvasView = canvasView
		self.protectedView = protectedView
		super.init(frame: .zero)
		setup()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
}

// MARK: - Setup

private extension SecureView {
	
	func setup() {
		backgroundColor = .clear
		canvasView.subviews.forEach {
			$0.removeFromSuperview()
		}
		canvasView.translatesAutoresizingMaskIntoConstraints = false
		addSubview(canvasView) {
			canvasView.boundsConstraints(to: self)
		}
		protectedView.translatesAutoresizingMaskIntoConstraints = false
		canvasView.addSubview(protectedView) {
			protectedView.boundsConstraints(to: canvasView)
		}
	}
	
}
