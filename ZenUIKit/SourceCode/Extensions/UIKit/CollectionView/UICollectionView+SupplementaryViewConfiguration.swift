import UIKit

public extension UICollectionView {
	
	/**
	Returns a reusable collection-view _SupplementaryView_ object, configured by a specified closure and adds it to the collection.
	String representation of _SupplementaryView_ class - used as a reuse identifier.
	If such an identifier has not yet been registered,
	this method automatically registers it for use in creating new collection supplementary views.
	- parameter indexPath: The index path specifying the location of the supplementary view in the collection view.
	- parameter kind: The kind of supplementary view to create. This value is defined by the layout object. This parameter must not be nil.
	- parameter configurator: The block for configure the supplementary view.
	- returns: A reusable supplementary view.
	*/
	func configuredSupplementaryView<SupplementaryView: UICollectionReusableView>(
		at indexPath: IndexPath,
		of kind: String,
		configurator: (SupplementaryView) -> Void
	) -> SupplementaryView {
		let identifier: String = SupplementaryView.reuseIdentifier
		
		if !supplementaryReuseIdentifiersSet.contains(identifier) {
			supplementaryReuseIdentifiersSet.insert(identifier)
			
			register(
				SupplementaryView.self,
				forSupplementaryViewOfKind: kind,
				withReuseIdentifier: identifier
			)
		}
		
		return supplementaryView(
			of: kind,
			at: indexPath,
			reuseIdentifier: identifier,
			configurator: configurator
		)
	}
	
	/**
	Returns a reusable collection-view _SupplementaryView_ object, configured by a specified closure and adds it to the collection.
	String representation of _SupplementaryView_ class - used as a _Nib_ name and reuse identifier.
	If such an identifier has not yet been registered,
	this method automatically registers it for use in creating new collection supplementary views.
	- parameter indexPath: The index path specifying the location of the supplementary view in the collection view.
	- parameter kind: The kind of supplementary view to create. This value is defined by the layout object. This parameter must not be nil.
	- parameter configurator: The block for configure the supplementary view.
	- returns: A reusable supplementary view.
	*/
	func configuredNibSupplementaryView<SupplementaryView: UICollectionReusableView>(
		of kind: String,
		at indexPath: IndexPath,
		configurator: (SupplementaryView) -> Void
	) -> SupplementaryView? {
		let identifier: String = SupplementaryView.reuseIdentifier
		
		if !supplementaryReuseIdentifiersSet.contains(identifier) {
			supplementaryReuseIdentifiersSet.insert(identifier)
			
			register(
				UINib(
					nibName: identifier,
					bundle: nil
				),
				forSupplementaryViewOfKind: kind,
				withReuseIdentifier: identifier
			)
		}
		
		return supplementaryView(
			of: kind,
			at: indexPath,
			reuseIdentifier: identifier,
			configurator: configurator
		)
	}
	
	/**
	Returns an empty reusable collection-view _UICollectionReusableView_ object and adds it to the collection.
	String representation of _UICollectionReusableView_ class - used as a reuse identifier.
	If such an identifier has not yet been registered,
	this method automatically registers it for use in creating new collection supplementary views.
	- parameter indexPath: The index path specifying the location of the supplementary view in the collection view.
	- parameter kind: The kind of supplementary view to create. This value is defined by the layout object. This parameter must not be nil.
	- returns: An empty reusable supplementary view.
	*/
	func configuredEmptySupplementaryView(
		at indexPath: IndexPath,
		of kind: String
	) -> UICollectionReusableView {
		let identifier: String = UICollectionReusableView.reuseIdentifier
		
		if !supplementaryReuseIdentifiersSet.contains(identifier) {
			supplementaryReuseIdentifiersSet.insert(identifier)
			
			register(
				UICollectionReusableView.self,
				forSupplementaryViewOfKind: kind,
				withReuseIdentifier: identifier
			)
		}
		
		return supplementaryView(
			of: kind,
			at: indexPath,
			reuseIdentifier: identifier,
			configurator: { _ in }
		)
	}
	
}

// MARK: - Build Supplementary View

private extension UICollectionView {
	
	func supplementaryView<SupplementaryView: UICollectionReusableView>(
		of kind: String,
		at indexPath: IndexPath,
		reuseIdentifier: String,
		configurator: (SupplementaryView) -> Void
	) -> SupplementaryView {
		let supplementaryView = dequeueReusableSupplementaryView(
			ofKind: kind,
			withReuseIdentifier: reuseIdentifier,
			for: indexPath
			) as! SupplementaryView
		
		configurator(supplementaryView)
		
		return supplementaryView
	}
	
}
