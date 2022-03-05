import UIKit

// uicollectionview resizable for content

open class AutosizingCollectionView: UICollectionView {
	
	// MARK: - Life Cycle
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		setup()
	}

	public override init(
		frame: CGRect,
		collectionViewLayout layout: UICollectionViewLayout
	) {
		super.init(
			frame: frame,
			collectionViewLayout: layout
		)

		setup()
	}
	
	// MARK: - Layout

	open override func layoutSubviews() {
		super.layoutSubviews()
		
		guard !bounds.size.equalTo(intrinsicContentSize) else {
			return
		}
		invalidateIntrinsicContentSize()
	}

	open override var intrinsicContentSize: CGSize {
		contentSize
	}
	
}

// MARK: - Setup

private extension AutosizingCollectionView {
	
	func setup() {
		isScrollEnabled = false
		bounces = false
	}
	
}
