import UIKit
import Combine

final class GestureSubscription<SubscriberType: Subscriber>: Subscription where
	SubscriberType.Input == UIGestureRecognizer,
	SubscriberType.Failure == Never {
	
	// MARK: - Stored Properties
	
	private var subscriber: SubscriberType?
	private let gestureRecognizer: UIGestureRecognizer
	
	// MARK: - Life Cycle
	
	init(
		subscriber: SubscriberType,
		view: UIView,
		gesture: Gesture
	) {
		self.subscriber = subscriber
		
		gestureRecognizer = GestureRecognizerFactory().gestureRecognizer(
			for: gesture
		)
		gestureRecognizer.addTarget(
			self,
			action: #selector(eventHandler)
		)
		view.addGestureRecognizer(gestureRecognizer)
	}
	
	// MARK: - Subscription
	
	func request(_ demand: Subscribers.Demand) {}
	
	// MARK: - Cancellable
	
	func cancel() {
		subscriber = nil
	}
	
	// MARK: - Actions
	
	@objc private func eventHandler() {
		_ = subscriber?.receive(gestureRecognizer)
	}
	
}
