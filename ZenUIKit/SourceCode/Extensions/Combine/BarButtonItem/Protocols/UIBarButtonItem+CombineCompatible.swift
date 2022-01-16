import UIKit
import Combine

// MARK: - CombineCompatible

@available(iOS 13.0, *)
extension UIBarButtonItem: CombineCompatible {}

// MARK: - Publishers

@available(iOS 13.0, *)
public extension CombineCompatible where Self: UIBarButtonItem {
	
	var tapPublisher: AnyPublisher<Self, Never> {
		BarButtonItemPublisher(item: self).eraseToAnyPublisher()
	}
	
}
