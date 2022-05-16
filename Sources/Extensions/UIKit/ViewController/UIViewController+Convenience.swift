import UIKit

public extension UIViewController {
	
	/// Returns the highest view controller in the receiver's hierarchy.
	var topViewController: UIViewController? {
		switch self {
		case let navigationController as UINavigationController:
			return navigationController.visibleViewController?.topViewController
		case let tabBarController as UITabBarController:
			return tabBarController.selectedViewController?.topViewController
		default:
			return presentedViewController?.topViewController ?? self
		}
	}
	
}
