import UIKit

public extension UICollectionView {
	
	/**
	 Returns a reusable collection-view cell object, configured by a specified closure and adds it to the collection.
	 String representation of _Cell_ class - used as a reuse identifier.
	 If such an identifier has not yet been registered,
	 this method automatically registers it for use in creating new collection cells.
	 - parameter indexPath: An index path identifying a row in the collection view.
	 - parameter configurator: The block for configure the cell.
	 - returns: A reusable collection-view cell object.
	 */
	func configuredCell<Cell: UICollectionViewCell>(
		at indexPath: IndexPath,
		configurator: (Cell) -> Void
	) -> Cell {
		let identifier: String = Cell.reuseIdentifier
		if !cellReuseIdentifiersSet.contains(identifier) {
			cellReuseIdentifiersSet.insert(identifier)
			register(
				Cell.self,
				forCellWithReuseIdentifier: identifier
			)
		}
		return cell(
			at: indexPath,
			reuseIdentifier: identifier,
			configurator: configurator
		)
	}
	
	/**
	 Returns a reusable collection-view cell object, configured by a specified closure and adds it to the collection.
	 String representation of _Cell_ class - used as a _Nib_ name and reuse identifier.
	 If such an identifier has not yet been registered,
	 this method automatically registers it for use in creating new collection cells.
	 - parameter indexPath: An index path identifying a row in the collection view.
	 - parameter configurator: The block for configure the cell.
	 - returns: A reusable collection-view cell object.
	 */
	func configuredNibCell<Cell: UICollectionViewCell>(
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
				forCellWithReuseIdentifier: identifier
			)
		}
		return cell(
			at: indexPath,
			reuseIdentifier: identifier,
			configurator: configurator
		)
	}
	
	/**
	 Returns an empty reusable collection-view cell object and adds it to the collection.
	 String representation of _UICollectionViewCell_ class - used as a reuse identifier.
	 If such an identifier has not yet been registered,
	 this method automatically registers it for use in creating new collection cells.
	 - parameter indexPath: An index path identifying a row in the collection view.
	 - returns: An empty reusable collection-view cell object.
	 */
	func configuredEmptyCell(at indexPath: IndexPath) -> UICollectionViewCell {
		configuredCell(at: indexPath) { _ in }
	}
	
}

// MARK: - Build Cell

private extension UICollectionView {
	
	func cell<Cell: UICollectionViewCell>(
		at indexPath: IndexPath,
		reuseIdentifier: String,
		configurator: (Cell) -> Void
	) -> Cell {
		let cell: Cell = dequeueReusableCell(
			withReuseIdentifier: reuseIdentifier,
			for: indexPath
		) as! Cell
		configurator(cell)
		return cell
	}
	
}
