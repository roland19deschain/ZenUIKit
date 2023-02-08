import UIKit

public extension UIViewController {
	
	/// Returns the highest view controller in the receiver's hierarchy.
	var currentlyVisibleViewController: UIViewController? {
		switch self {
		case let navigationController as UINavigationController:
			return navigationController.visibleViewController?.currentlyVisibleViewController
		case let tabBarController as UITabBarController:
			return tabBarController.selectedViewController?.currentlyVisibleViewController
		default:
			return presentedViewController?.currentlyVisibleViewController ?? self
		}
	}
	
}
