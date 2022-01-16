import UIKit
import Combine

// TODO: Add documentation

// MARK: - Publishers

@available(iOS 13.0, *)
public extension CombineCompatible where Self: UIControl {
	
	var tapEventPublisher: AnyPublisher<Self, Never> {
		publisher(for: .touchUpInside)
	}
	
	var valueChangedPublisher: AnyPublisher<Self, Never> {
		publisher(for: .valueChanged)
	}
	
	func publisher(for events: Self.Event) -> AnyPublisher<Self, Never> {
		ControlPublisher(
			control: self,
			events: events
		).eraseToAnyPublisher()
	}
	
}
