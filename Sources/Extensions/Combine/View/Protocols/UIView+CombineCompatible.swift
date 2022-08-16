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
	
	func tapGesture(
		delegate: UIGestureRecognizerDelegate
	) -> AnyPublisher<UITapGestureRecognizer, Never> {
		publisher(
			for: .tap,
			delegate: delegate
		)
	}
	
	var swipeGesturePublisher: AnyPublisher<UISwipeGestureRecognizer, Never> {
		publisher(for: .swipe)
	}
	
	func swipeGesture(
		delegate: UIGestureRecognizerDelegate
	) -> AnyPublisher<UITapGestureRecognizer, Never> {
		publisher(
			for: .swipe,
			delegate: delegate
		)
	}
	
	var longPressGesturePublisher: AnyPublisher<UILongPressGestureRecognizer, Never> {
		publisher(for: .longPress)
	}
	
	func longPressGesture(
		delegate: UIGestureRecognizerDelegate
	) -> AnyPublisher<UITapGestureRecognizer, Never> {
		publisher(
			for: .longPress,
			delegate: delegate
		)
	}
	
	var panGesturePublisher: AnyPublisher<UIPanGestureRecognizer, Never> {
		publisher(for: .pan)
	}
	
	func panGesture(
		delegate: UIGestureRecognizerDelegate
	) -> AnyPublisher<UITapGestureRecognizer, Never> {
		publisher(
			for: .pan,
			delegate: delegate
		)
	}
	
	var pinchGesturePublisher: AnyPublisher<UIPinchGestureRecognizer, Never> {
		publisher(for: .pinch)
	}
	
	func pinchGesture(
		delegate: UIGestureRecognizerDelegate
	) -> AnyPublisher<UITapGestureRecognizer, Never> {
		publisher(
			for: .pinch,
			delegate: delegate
		)
	}
	
	var screenEdgePanGesturePublisher: AnyPublisher<UIScreenEdgePanGestureRecognizer, Never> {
		publisher(for: .screenEdgePan)
	}
	
	func screenEdgePanGesture(
		delegate: UIGestureRecognizerDelegate
	) -> AnyPublisher<UITapGestureRecognizer, Never> {
		publisher(
			for: .screenEdgePan,
			delegate: delegate
		)
	}
	
}

// MARK: - Publisher for Gesture

private extension CombineCompatible where Self: UIView {
	
	func publisher<T: UIGestureRecognizer>(
		for gesture: Gesture,
		delegate: UIGestureRecognizerDelegate? = nil
	) -> AnyPublisher<T, Never> {
		GesturePublisher(
			view: self,
			gesture: gesture,
			delegate: delegate
		).compactMap {
			$0 as? T
		}.eraseToAnyPublisher()
	}
	
}
