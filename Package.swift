// swift-tools-version:5.5

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
	dependencies: [
		.package(url: "https://github.com/roland19deschain/ZenSwift.git", from: "2.0.1")
	],
	targets: [
		.target(
			name: "ZenUIKit",
			dependencies: [
				.product(name: "ZenSwift", package: "zenswift")
			],
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
