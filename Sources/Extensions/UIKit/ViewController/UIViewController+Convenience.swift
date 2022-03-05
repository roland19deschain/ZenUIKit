import UIKit

extension UIViewController {
	
	/// Returns the highest view controller in the receiver's hierarchy.
	var theHighestViewController: UIViewController? {
		switch self {
		case let navigationController as UINavigationController:
			return navigationController.visibleViewController?.theHighestViewController
		case let tabBarController as UITabBarController:
			return tabBarController.selectedViewController?.theHighestViewController
		default:
			return presentedViewController?.theHighestViewController ?? self
		}
	}
	
}
