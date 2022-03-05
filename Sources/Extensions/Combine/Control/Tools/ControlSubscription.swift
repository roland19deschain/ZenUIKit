import UIKit
import Combine

final class ControlSubscription<
	SubscriberType: Subscriber,
	Control: UIControl
>: Subscription where
	SubscriberType.Input == Control,
	SubscriberType.Failure == Never {
	
	// MARK: - Stored Properties
	
	private var subscriber: SubscriberType?
	private let control: Control
	
	// MARK: - Life Cycle
	
	init(
		subscriber: SubscriberType,
		control: Control,
		event: UIControl.Event
	) {
		self.subscriber = subscriber
		self.control = control
		
		control.addTarget(
			self,
			action: #selector(eventHandler),
			for: event
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
		_ = subscriber?.receive(control)
	}
	
}
