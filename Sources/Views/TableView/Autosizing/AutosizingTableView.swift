import UIKit

/// `UITableView` defining its actual size (aka `intrinsicContentSize`) as the size of its contents.
public final class AutosizingTableView: UITableView {
	
	public override var contentSize: CGSize {
		didSet {
			invalidateIntrinsicContentSize()
		}
	}
	
	public override var intrinsicContentSize: CGSize {
		layoutIfNeeded()
		return .init(
			width: contentInset.left + contentSize.width + contentInset.right,
			height: contentInset.top + contentSize.height + contentInset.bottom
		)
	}

	
}
