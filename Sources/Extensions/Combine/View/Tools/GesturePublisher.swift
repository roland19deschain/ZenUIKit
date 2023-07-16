import UIKit
import Combine

struct GesturePublisher: Publisher {
	
	// MARK: - Stored Properties
	
	private let gestureRecognizer: Output
	
	// MARK: - Life Cycle
	
	init(
		view: UIView,
		builder: () -> Output
	) {
		gestureRecognizer = builder()
		view.addGestureRecognizer(gestureRecognizer)
	}
	
	init(
		view: UIView,
		gesture: Gesture,
		delegate: UIGestureRecognizerDelegate? = nil
	) {
		gestureRecognizer = GestureRecognizerFactory().gestureRecognizer(
			for: gesture
		)
		gestureRecognizer.delegate = delegate
		view.addGestureRecognizer(gestureRecognizer)
	}
	
	// MARK: - Publisher
	
	typealias Output = UIGestureRecognizer
	typealias Failure = Never
	
	func receive<S>(subscriber: S) where
		S: Subscriber,
		GesturePublisher.Failure == S.Failure,
		GesturePublisher.Output == S.Input {
		let subscription = GestureSubscription(
			subscriber: subscriber,
			gestureRecognizer: gestureRecognizer
		)
		subscriber.receive(subscription: subscription)
	}
	
}
