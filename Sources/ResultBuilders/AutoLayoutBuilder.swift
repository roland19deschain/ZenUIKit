import UIKit

@resultBuilder public struct AutoLayoutBuilder {
	
	public static func buildEither(
		first component: [LayoutGroupProtocol]
	) -> [NSLayoutConstraint] {
		component.flatMap {
			$0.constraints
		}
	}
	
	public static func buildEither(
		second component: [LayoutGroupProtocol]
	) -> [NSLayoutConstraint] {
		component.flatMap {
			$0.constraints
		}
	}
	
	public static func buildBlock(
		_ components: LayoutGroupProtocol...
	) -> [NSLayoutConstraint] {
		components.flatMap {
			$0.constraints
		}
	}
	
	public static func buildOptional(
		_ component: [LayoutGroupProtocol]?
	) -> [NSLayoutConstraint] {
		component?.flatMap {
			$0.constraints
		} ?? []
	}
	
}
