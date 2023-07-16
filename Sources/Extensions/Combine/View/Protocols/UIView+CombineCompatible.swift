import UIKit
import Combine

// MARK: - CombineCompatible

extension UIView: CombineCompatible {}

// MARK: - Tap

public extension CombineCompatible where Self: UIView {
	
	var tapGesturePublisher: AnyPublisher<UITapGestureRecognizer, Never> {
		publisher(gesture: .tap)
	}
	
	func tapGesture(
		builder: () -> UITapGestureRecognizer
	) -> AnyPublisher<UITapGestureRecognizer, Never> {
		publisher(builder: builder)
	}
	
	func tapGesture(
		delegate: UIGestureRecognizerDelegate
	) -> AnyPublisher<UITapGestureRecognizer, Never> {
		publisher(
			gesture: .tap,
			delegate: delegate
		)
	}
	
}

// MARK: - Swipe

public extension CombineCompatible where Self: UIView {
	
	var swipeGesturePublisher: AnyPublisher<UISwipeGestureRecognizer, Never> {
		publisher(gesture: .swipe)
	}
	
	func swipeGesture(
		builder: () -> UISwipeGestureRecognizer
	) -> AnyPublisher<UISwipeGestureRecognizer, Never> {
		publisher(builder: builder)
	}
	
	func swipeGesture(
		delegate: UIGestureRecognizerDelegate
	) -> AnyPublisher<UISwipeGestureRecognizer, Never> {
		publisher(
			gesture: .swipe,
			delegate: delegate
		)
	}
	
}

// MARK: - Long Press

public extension CombineCompatible where Self: UIView {
	
	var longPressGesturePublisher: AnyPublisher<UILongPressGestureRecognizer, Never> {
		publisher(gesture: .longPress)
	}
	
	func longPressGesture(
		builder: () -> UILongPressGestureRecognizer
	) -> AnyPublisher<UILongPressGestureRecognizer, Never> {
		publisher(builder: builder)
	}
	
	func longPressGesture(
		delegate: UIGestureRecognizerDelegate
	) -> AnyPublisher<UILongPressGestureRecognizer, Never> {
		publisher(
			gesture: .longPress,
			delegate: delegate
		)
	}
	
}

// MARK: - Pan

public extension CombineCompatible where Self: UIView {
	
	var panGesturePublisher: AnyPublisher<UIPanGestureRecognizer, Never> {
		publisher(gesture: .pan)
	}
	
	func panGesture(
		builder: () -> UIPanGestureRecognizer
	) -> AnyPublisher<UIPanGestureRecognizer, Never> {
		publisher(builder: builder)
	}
	
	func panGesture(
		delegate: UIGestureRecognizerDelegate
	) -> AnyPublisher<UIPanGestureRecognizer, Never> {
		publisher(
			gesture: .pan,
			delegate: delegate
		)
	}
	
}

// MARK: - Pinch

public extension CombineCompatible where Self: UIView {
	
	var pinchGesturePublisher: AnyPublisher<UIPinchGestureRecognizer, Never> {
		publisher(gesture: .pinch)
	}
	
	func pinchGesture(
		builder: () -> UIPinchGestureRecognizer
	) -> AnyPublisher<UIPinchGestureRecognizer, Never> {
		publisher(builder: builder)
	}
	
	func pinchGesture(
		delegate: UIGestureRecognizerDelegate
	) -> AnyPublisher<UIPinchGestureRecognizer, Never> {
		publisher(
			gesture: .pinch,
			delegate: delegate
		)
	}
	
}

// MARK: - Pinch

public extension CombineCompatible where Self: UIView {
	
	var screenEdgePanGesturePublisher: AnyPublisher<UIScreenEdgePanGestureRecognizer, Never> {
		publisher(gesture: .screenEdgePan)
	}
	
	func screenEdgePanGesture(
		builder: () -> UIScreenEdgePanGestureRecognizer
	) -> AnyPublisher<UIScreenEdgePanGestureRecognizer, Never> {
		publisher(builder: builder)
	}
	
	func screenEdgePanGesture(
		delegate: UIGestureRecognizerDelegate
	) -> AnyPublisher<UIScreenEdgePanGestureRecognizer, Never> {
		publisher(
			gesture: .screenEdgePan,
			delegate: delegate
		)
	}
	
}

// MARK: - Publisher for Gesture

private extension CombineCompatible where Self: UIView {
	
	func publisher<T: UIGestureRecognizer>(
		builder: () -> T
	) -> AnyPublisher<T, Never> {
		GesturePublisher(
			view: self,
			builder: builder
		).compactMap {
			$0 as? T
		}.eraseToAnyPublisher()
	}
	
	func publisher<T: UIGestureRecognizer>(
		gesture: Gesture,
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
