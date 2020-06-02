import UIKit

extension UICollectionView {
	
	/// Returns a set of cell reuse identifiers, registered in this class for reuse.
	var cellReuseIdentifiersSet: Set<String> {
		get {
			(objc_getAssociatedObject(
				self,
				&Keys.cellReuseIdentifiers
				) as? Set<String>) ?? Set()
		}
		set {
			objc_setAssociatedObject(
				self,
				&Keys.cellReuseIdentifiers,
				newValue,
				.OBJC_ASSOCIATION_RETAIN_NONATOMIC
			)
		}
	}
	
	/// Returns a set of supplementary view reuse identifiers, registered in this class for reuse.
	var supplementaryReuseIdentifiersSet: Set<String> {
		get {
			(objc_getAssociatedObject(
				self,
				&Keys.supplementaryReuseIdentifiers
				) as? Set<String>) ?? Set()
		}
		set {
			objc_setAssociatedObject(
				self,
				&Keys.supplementaryReuseIdentifiers,
				newValue,
				.OBJC_ASSOCIATION_RETAIN_NONATOMIC
			)
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
