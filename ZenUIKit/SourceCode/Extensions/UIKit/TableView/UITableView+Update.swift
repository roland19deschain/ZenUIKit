import UIKit

public extension UITableView {
	
	/// You can use this method to animate the change in the row heights without reloading the cells.
	func reloadLayout() {
		beginUpdates()
		endUpdates()
	}
	
}
