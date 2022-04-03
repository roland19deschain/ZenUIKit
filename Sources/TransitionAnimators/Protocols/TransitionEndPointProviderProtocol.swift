import UIKit

public protocol TransitionEndPointProviderProtocol {
	
	func transitionEndPoint(
		for viewController: UIViewController
	) -> CGPoint
	
}
