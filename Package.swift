// swift-tools-version:5.3

import PackageDescription

let package = Package(
	name: "ZenUIKit",
	platforms: [
		.macOS(.v10_10),
		.iOS(.v9),
		.tvOS(.v9),
		.watchOS(.v2)
	],
	products: [
		.library(
			name: "ZenUIKit",
			type: .static,
			targets: ["ZenUIKit"]
		)
	],
	dependencies: [],
	targets: [
		.target(
			name: "ZenUIKit",
			dependencies: [],
			path: "ZenUIKit/SourceCode/"
		)
	]
)
