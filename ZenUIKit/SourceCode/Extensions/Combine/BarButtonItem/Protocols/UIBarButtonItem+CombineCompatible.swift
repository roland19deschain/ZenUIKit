import UIKit
import Combine

// MARK: - CombineCompatible

extension UIBarButtonItem: CombineCompatible {}

// MARK: - Publishers

public extension CombineCompatible where Self: UIBarButtonItem {
	
	var tapPublisher: AnyPublisher<Self, Never> {
		BarButtonItemPublisher(item: self).eraseToAnyPublisher()
	}
	
}
