// swift-tools-version:5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
	name: "ZenUIKit",
	platforms: [.iOS(.v13)],
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
			path: "Sources/"
		),
		.testTarget(
			name: "ZenUIKitTests",
			dependencies: ["ZenUIKit"],
			path: "Tests/"
		)
	],
	swiftLanguageVersions: [.v5]
)
