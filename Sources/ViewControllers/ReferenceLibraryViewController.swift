import UIKit

public final class ReferenceLibraryViewController: UIReferenceLibraryViewController {
	
	// MARK: - Stored Properties - Closures
	
	public var completion: (() -> Void)?
	
	// MARK: - Life Cycle
	
	public override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		
		guard isBeingDismissed else {
			return
		}
		completion?()
	}
	
}
