// swift-tools-version:5.3

import PackageDescription

let package = Package(
	name: "ZenUIKit",
	platforms: [.iOS(.v12_1)],
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
