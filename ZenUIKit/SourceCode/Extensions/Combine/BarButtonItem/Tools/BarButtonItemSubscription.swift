import UIKit
import Combine

final class BarButtonItemSubscription<
	SubscriberType: Subscriber,
	Item: UIBarButtonItem
>: Subscription where
SubscriberType.Input == Item,
SubscriberType.Failure == Never {
	
	// MARK: - Stored Properties
	
	private var subscriber: SubscriberType?
	private let item: Item
	
	// MARK: - Life Cycle
	
	init(
		subscriber: SubscriberType,
		item: Item
	) {
		self.subscriber = subscriber
		self.item = item
		
		item.target = self
		item.action = #selector(eventHandler)
	}
	
	// MARK: - Subscription
	
	func request(_ demand: Subscribers.Demand) {}
	
	// MARK: - Cancellable
	
	func cancel() {
		subscriber = nil
	}
	
	// MARK: - Actions
	
	@objc private func eventHandler() {
		_ = subscriber?.receive(item)
	}
	
}
