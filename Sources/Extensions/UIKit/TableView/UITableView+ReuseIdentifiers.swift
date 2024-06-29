import UIKit

extension UITableView {
	
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
					pointer,
					newValue,
					.OBJC_ASSOCIATION_RETAIN_NONATOMIC
				)
			}
		}
	}
	
	/// Returns a set of header / footer reuse identifiers, registered in this class for reuse.
	var headerFooterReuseIdentifiersSet: Set<String> {
		get {
			withUnsafePointer(to: Keys.headerFooterReuseIdentifiers) { pointer in
				(objc_getAssociatedObject(
					self,
					pointer
				) as? Set<String>) ?? Set()
			}
		}
		set {
			withUnsafePointer(to: Keys.headerFooterReuseIdentifiers) { pointer in
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

private extension UITableView {
	
	enum Keys {
		static var cellReuseIdentifiers: String = "CellReuseIdentifiers"
		static var headerFooterReuseIdentifiers: String = "HeaderFooterReuseIdentifiers"
	}
	
}
