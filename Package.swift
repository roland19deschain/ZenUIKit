// swift-tools-version: 5.10

import PackageDescription

let package = Package(
	name: "ZenUIKit",
	platforms: [.iOS(.v14)],
	products: [
		.library(
			name: "ZenUIKit",
			type: .static,
			targets: ["ZenUIKit"]
		)
	],
	dependencies: [
		.package(url: "https://github.com/roland19deschain/ZenSwift", from: "2.1.14"),
		.package(url: "https://github.com/roland19deschain/ZenCoreGraphics", from: "2.0.2")
	],
	targets: [
		.target(
			name: "ZenUIKit",
			dependencies: [
				.product(name: "ZenSwift", package: "zenswift"),
				.product(name: "ZenCoreGraphics", package: "zencoregraphics")
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
