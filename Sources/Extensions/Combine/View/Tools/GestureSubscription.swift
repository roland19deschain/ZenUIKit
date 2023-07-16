import UIKit
import Combine

final class GestureSubscription<SubscriberType: Subscriber>: Subscription where
	SubscriberType.Input == UIGestureRecognizer,
	SubscriberType.Failure == Never {
	
	// MARK: - Stored Properties
	
	private var subscriber: SubscriberType?
	private let gestureRecognizer: SubscriberType.Input
	
	// MARK: - Life Cycle
	
	init(
		subscriber: SubscriberType,
		gestureRecognizer: SubscriberType.Input
	) {
		self.subscriber = subscriber
		self.gestureRecognizer = gestureRecognizer
		
		gestureRecognizer.addTarget(
			self,
			action: #selector(eventHandler)
		)
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
