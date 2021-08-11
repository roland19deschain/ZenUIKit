import UIKit

public final class AutosizingTextView: UITextView {
	
	// MARK: - Computed Properties
	
	public override var intrinsicContentSize: CGSize {
		guard maximumAllowableHeight > 0,
			contentSize.height > maximumAllowableHeight else {
			return super.intrinsicContentSize
		}
		return CGSize(
			width: UIView.noIntrinsicMetric,
			height: maximumAllowableHeight
		)
	}
	
	// MARK: - Stored Properties
	
	public weak var autosizingDelegate: AutosizingTextViewDelegate?
	
	public var maximumAllowableHeight: CGFloat = 0 {
		didSet {
			updateScrollAvailability()
		}
	}
	
	public override var isScrollEnabled: Bool {
		didSet {
			updateLayout()
		}
	}
	
	// MARK: - Life Cycle
	
	public override init(
		frame: CGRect,
		textContainer: NSTextContainer? = nil
	) {
		super.init(
			frame: frame,
			textContainer: textContainer
		)
		
		setupObservers()
	}
	
	public required init?(coder aDecoder: NSCoder) {
		super.init(coder: aDecoder)
		
		setupObservers()
	}
	
	deinit {
		NotificationCenter.default.removeObserver(self)
	}
	
}

// MARK: - Layout

extension AutosizingTextView {
	
	public override func layoutSubviews() {
		super.layoutSubviews()
		
		updateScrollAvailability()
	}
	
}

// MARK: - Update

private extension AutosizingTextView {
	
	func updateScrollAvailability() {
		guard maximumAllowableHeight > 0 else {
			return
		}
		isScrollEnabled = contentSize.height > maximumAllowableHeight
	}
	
	func updateLayout() {
		invalidateIntrinsicContentSize()
		
		autosizingDelegate?.autosizingTextViewDidUpdateLayout(
			textView: self
		)
	}
	
}

// MARK: - Observers

private extension AutosizingTextView {
	
	func setupObservers() {
		NotificationCenter.default.addObserver(
				self,
				selector: #selector(handleText(change:)),
				name: UITextView.textDidChangeNotification,
				object: nil
		)
	}
	
}

// MARK: - Actions

private extension AutosizingTextView {
	
	@objc func handleText(change notification: Notification) {
		updateScrollAvailability()
	}
	
}
