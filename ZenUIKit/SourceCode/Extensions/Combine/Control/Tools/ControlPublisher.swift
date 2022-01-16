import UIKit
import Combine

@available(iOS 13.0, *)
struct ControlPublisher<Control: UIControl>: Publisher {
	
	// MARK: - Stored Properties
	
	private let control: Control
	private let controlEvents: UIControl.Event
	
	// MARK: - Life Cycle
	
	init(
		control: Control,
		events: UIControl.Event
	) {
		self.control = control
		self.controlEvents = events
	}
	
	// MARK: - Publisher
	
	typealias Output = Control
	typealias Failure = Never
	
	func receive<S>(subscriber: S) where
		S: Subscriber,
		S.Failure == Self.Failure,
		S.Input == Self.Output {
		let subscription = ControlSubscription(
			subscriber: subscriber,
			control: control,
			event: controlEvents
		)
		subscriber.receive(subscription: subscription)
	}
	
}
