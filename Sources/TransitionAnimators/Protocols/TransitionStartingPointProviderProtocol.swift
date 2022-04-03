import UIKit

public protocol TransitionStartingPointProviderProtocol {
	
	func transitionStartingPoint(
		for viewController: UIViewController
	) -> CGPoint
	
}
