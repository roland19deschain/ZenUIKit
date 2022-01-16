import UIKit
import Combine

struct BarButtonItemPublisher<Item: UIBarButtonItem>: Combine.Publisher {
	
	// MARK: - Stored Properties
	
	let item: Item
	
	// MARK: - Life Cycle
	
	init(item: Item) {
		self.item = item
	}
	
	// MARK: - Publisher
	
	typealias Output = Item
	typealias Failure = Never
	
	func receive<S>(subscriber: S) where
		S: Subscriber,
		Self.Failure == S.Failure,
		Self.Output == S.Input {
		let subscription = BarButtonItemSubscription(
			subscriber: subscriber,
			item: item
		)
		subscriber.receive(subscription: subscription)
	}
	
}
