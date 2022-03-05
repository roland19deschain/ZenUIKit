import UIKit

public extension UITableView {

	/**
	Selects all rows in the table view.
	- parameter animated: true if you want to animate the selection, and false if the change should be immediate.
	*/
	func selectAllRows(animated: Bool = false) {
		for section in 0..<numberOfSections {
			for row in 0..<numberOfRows(inSection: section) {
				selectRow(
					at: IndexPath(row: row, section: section),
					animated: animated,
					scrollPosition: .none
				)
			}
		}
	}
	
	/**
	Deselects all rows in the table view.
	- parameter animated: true if you want to animate the deselection, and false if the change should be immediate.
	*/
	func deselectAllRows(animated: Bool = false) {
		for section in 0..<numberOfSections {
			for row in 0..<numberOfRows(inSection: section) {
				deselectRow(
					at: IndexPath(row: row, section: section),
					animated: animated
				)
			}
		}
	}
	
}
