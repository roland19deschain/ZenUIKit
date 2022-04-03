import UIKit

public extension TransitionAnimator {
	
	enum Default {
		public static var type: TransitionType { .navigation }
		public static var dampingRatio: CGFloat { 0.75 }
		public static var duration: TimeInterval { 0.5 }
	}
	
}
