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
	
	/// Returns a set of header / footer reuse identifiers, registered in this class for reuse.
	var headerFooterReuseIdentifiersSet: Set<String> {
		get {
			(objc_getAssociatedObject(
				self,
				&Keys.headerFooterReuseIdentifiers
				) as? Set<String>) ?? Set()
		}
		set {
			objc_setAssociatedObject(
				self,
				&Keys.headerFooterReuseIdentifiers,
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
		static var headerFooterReuseIdentifiers: String = "HeaderFooterReuseIdentifiers"
	}
	
}
