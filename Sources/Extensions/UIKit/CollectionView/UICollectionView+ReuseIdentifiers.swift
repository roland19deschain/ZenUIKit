import UIKit

extension UICollectionView {
	
	/// Returns a set of cell reuse identifiers, registered in this class for reuse.
	var cellReuseIdentifiersSet: Set<String> {
		get {
			withUnsafePointer(to: Keys.cellReuseIdentifiers) { pointer in
				(objc_getAssociatedObject(
					self,
					pointer
				) as? Set<String>) ?? Set()
			}
		}
		set {
			withUnsafePointer(to: Keys.cellReuseIdentifiers) { pointer in
				objc_setAssociatedObject(
					self,
					Keys.cellReuseIdentifiers,
					newValue,
					.OBJC_ASSOCIATION_RETAIN_NONATOMIC
				)
			}
		}
	}
	
	/// Returns a set of supplementary view reuse identifiers, registered in this class for reuse.
	var supplementaryReuseIdentifiersSet: Set<String> {
		get {
			withUnsafePointer(to: Keys.supplementaryReuseIdentifiers) { pointer in
				(objc_getAssociatedObject(
					self,
					pointer
				) as? Set<String>) ?? Set()
			}
		}
		set {
			withUnsafePointer(to: Keys.supplementaryReuseIdentifiers) { pointer in
				objc_setAssociatedObject(
					self,
					pointer,
					newValue,
					.OBJC_ASSOCIATION_RETAIN_NONATOMIC
				)
			}
		}
	}
	
}

// MARK: - Constants

private extension UICollectionView {
	
	enum Keys {
		static var cellReuseIdentifiers: String = "CellReuseIdentifiers"
		static var supplementaryReuseIdentifiers: String = "SupplementaryReuseIdentifiers"
	}
	
}
