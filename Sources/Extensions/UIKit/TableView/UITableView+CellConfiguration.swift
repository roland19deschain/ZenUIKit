import UIKit

public extension UITableView {
	
	/**
	 Returns a reusable table-view cell object, configured by a specified closure and adds it to the table.
	 String representation of _Cell_ class - used as a reuse identifier.
	 If such an identifier has not yet been registered,
	 this method automatically registers it for use in creating new table cells.
	 - parameter indexPath: An index path identifying a row in the table view.
	 - parameter configurator: The block for configure the cell.
	 - returns: A reusable table-view cell object.
	 */
	func configuredCell<Cell: UITableViewCell>(
		at indexPath: IndexPath,
		configurator: (Cell) -> Void
	) -> Cell {
		let identifier: String = Cell.reuseIdentifier
		
		if !cellReuseIdentifiersSet.contains(identifier) {
			cellReuseIdentifiersSet.insert(identifier)
			
			register(
				Cell.self,
				forCellReuseIdentifier: identifier
			)
		}
		
		return cell(
			at: indexPath,
			reuseIdentifier: identifier,
			configurator: configurator
		)
	}
	
	/**
	 Returns a reusable table-view cell object, configured by a specified closure and adds it to the table.
	 String representation of _Cell_ class - used as a _Nib_ name and reuse identifier.
	 If such an identifier has not yet been registered,
	 this method automatically registers it for use in creating new table cells.
	 - parameter indexPath: An index path identifying a row in the table view.
	 - parameter configurator: The block for configure the cell.
	 - returns: A reusable table-view cell object.
	 */
	func configuredNibCell<Cell: UITableViewCell>(
		at indexPath: IndexPath,
		configurator: (Cell) -> Void
	) -> Cell {
		let identifier: String = Cell.reuseIdentifier
		
		if !cellReuseIdentifiersSet.contains(identifier) {
			cellReuseIdentifiersSet.insert(identifier)
			
			register(
				UINib(
					nibName: identifier,
					bundle: nil
				),
				forCellReuseIdentifier: identifier
			)
		}
		
		return cell(
			at: indexPath,
			reuseIdentifier: identifier,
			configurator: configurator
		)
	}
	
	/**
	 Returns an empty reusable table-view cell object and adds it to the table.
	 String representation of _UITableViewCell_ class - used as a reuse identifier.
	 If such an identifier has not yet been registered,
	 this method automatically registers it for use in creating new table cells.
	 - parameter indexPath: An index path identifying a row in the table view.
	 - returns: An empty reusable table-view cell object.
	 */
	func configuredEmptyCell(at indexPath: IndexPath) -> UITableViewCell {
		configuredCell(
			at: indexPath,
			configurator: { _ in }
		)
	}
	
}

// MARK: - Build Cell

private extension UITableView {
	
	func cell<Cell: UITableViewCell>(
		at indexPath: IndexPath,
		reuseIdentifier: String,
		configurator: (Cell) -> Void
	) -> Cell {
		let cell: Cell = dequeueReusableCell(
			withIdentifier: reuseIdentifier,
			for: indexPath
		) as! Cell
		
		configurator(cell)
		
		return cell
	}
	
}
