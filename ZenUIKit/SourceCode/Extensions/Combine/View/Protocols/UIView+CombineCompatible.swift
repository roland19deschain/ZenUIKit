import UIKit
import Combine

// TODO: Add documentation

// MARK: - CombineCompatible

extension UIView: CombineCompatible {}

// MARK: - All Gestures Publisher

public extension CombineCompatible where Self: UIView {
	
	var tapGesturePublisher: AnyPublisher<UITapGestureRecognizer, Never> {
		publisher(for: .tap)
	}
	
	var swipeGesturePublisher: AnyPublisher<UISwipeGestureRecognizer, Never> {
		publisher(for: .swipe)
	}
	
	var longPressGesturePublisher: AnyPublisher<UILongPressGestureRecognizer, Never> {
		publisher(for: .longPress)
	}
	
	var panGesturePublisher: AnyPublisher<UIPanGestureRecognizer, Never> {
		publisher(for: .pan)
	}
	
	var pinchGesturePublisher: AnyPublisher<UIPinchGestureRecognizer, Never> {
		publisher(for: .pinch)
	}
	
	var screenEdgePanGesturePublisher: AnyPublisher<UIScreenEdgePanGestureRecognizer, Never> {
		publisher(for: .screenEdgePan)
	}
	
}

// MARK: - Publisher for Gesture

private extension CombineCompatible where Self: UIView {
	
	func publisher<T: UIGestureRecognizer>(for gesture: Gesture) -> AnyPublisher<T, Never> {
		GesturePublisher(
			view: self,
			gesture: gesture
		).compactMap {
			$0 as? T
		}.eraseToAnyPublisher()
	}
	
}
