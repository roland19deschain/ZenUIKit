import UIKit
import Combine

struct GesturePublisher: Publisher {
	
	// MARK: - Stored Properties
	
	private let view: UIView
	private let gesture: Gesture
	private let delegate: UIGestureRecognizerDelegate?
	
	// MARK: - Life Cycle
	
	init(
		view: UIView,
		gesture: Gesture,
		delegate: UIGestureRecognizerDelegate? = nil
	) {
		self.view = view
		self.gesture = gesture
		self.delegate = delegate
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
			view: view,
			gesture: gesture,
			delegate: delegate
		)
		subscriber.receive(subscription: subscription)
	}
	
}
