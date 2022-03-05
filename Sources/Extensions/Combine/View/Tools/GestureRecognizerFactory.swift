import UIKit

struct GestureRecognizerFactory {
	
	func gestureRecognizer(for gesture: Gesture) -> UIGestureRecognizer {
		switch gesture {
		case .tap:
			return UITapGestureRecognizer()
		case .swipe:
			return UISwipeGestureRecognizer()
		case .longPress:
			return UILongPressGestureRecognizer()
		case .pan:
			return UIPanGestureRecognizer()
		case .pinch:
			return UIPinchGestureRecognizer()
		case .screenEdgePan:
			return UIScreenEdgePanGestureRecognizer()
		}
	}
	
}
