import UIKit

public extension UITableView {
	
	/**
	Returns a reusable table-view header / footer object, configured by a specified closure and adds it to the table.
	String representation of _Header / Footer_ class - used as a reuse identifier.
	If such an identifier has not yet been registered,
	this method automatically registers it for use in creating new table headers and footers.
	- parameter configurator: The block for configure the header / footer.
	- returns: A reusable table-view header / footer object.
	*/
	func configuredHeaderFooter<HeaderFooter: UITableViewHeaderFooterView>(
		configurator: (HeaderFooter) -> Void
	) -> HeaderFooter {
		let identifier: String = HeaderFooter.reuseIdentifier
		if !headerFooterReuseIdentifiersSet.contains(identifier) {
			headerFooterReuseIdentifiersSet.insert(identifier)
			
			register(
				HeaderFooter.self,
				forHeaderFooterViewReuseIdentifier: identifier
			)
		}
		return headerFooter(
			reuseIdentifier: identifier,
			configurator: configurator
		)
	}
	
	/**
	Returns a reusable table-view header / footer object, configured by a specified closure and adds it to the table.
	String representation of _Header / Footer_ class - used as a _Nib_ name and reuse identifier.
	If such an identifier has not yet been registered,
	this method automatically registers it for use in creating new table headers and footers.
	- parameter configurator: The block for configure the header / footer.
	- returns: A reusable table-view header / footer object.
	*/
	func configuredNibHeaderFooter<HeaderFooter: UITableViewHeaderFooterView>(
		configurator: (HeaderFooter) -> Void
	) -> HeaderFooter? {
		let identifier: String = HeaderFooter.reuseIdentifier
		if !headerFooterReuseIdentifiersSet.contains(identifier) {
			headerFooterReuseIdentifiersSet.insert(identifier)
			register(
				UINib(
					nibName: identifier,
					bundle: nil
				),
				forHeaderFooterViewReuseIdentifier: identifier
			)
		}
		return headerFooter(
			reuseIdentifier: identifier,
			configurator: configurator
		)
	}
	
	/**
	Returns an empty reusable table-view header / footer object and adds it to the table.
	String representation of _UITableViewHeaderFooterView_ class - used as a reuse identifier.
	If such an identifier has not yet been registered,
	this method automatically registers it for use in creating new table headers and footers.
	- returns: An empty reusable table-view header / footer object.
	*/
	var configuredEmptyHeaderFooter: UITableViewHeaderFooterView {
		configuredHeaderFooter { _ in }
	}
	
}

// MARK: - Build Header / Footer View

private extension UITableView {
	
	func headerFooter<HeaderFooter: UITableViewHeaderFooterView>(
		reuseIdentifier: String,
		configurator: (HeaderFooter) -> Void
	) -> HeaderFooter {
		let headerFooter: HeaderFooter = dequeueReusableHeaderFooterView(
			withIdentifier: reuseIdentifier
		) as! HeaderFooter
		configurator(headerFooter)
		return headerFooter
	}
	
}
