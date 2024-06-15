// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AuroraEditorTextView",
    platforms: [.macOS(.v13)],
    products: [
        .library(
            name: "AuroraEditorTextView",
            targets: ["AuroraEditorTextView"]
        ),
    ],
    dependencies: [
		.package(
			url: "https://github.com/ChimeHQ/TextStory",
			from: "0.8.0"
		),
        .package(
            url: "https://github.com/apple/swift-collections.git",
            .upToNextMajor(from: "1.0.0")
        )
    ],
    targets: [
        .target(
            name: "AuroraEditorTextView",
            dependencies: [
				"TextStory",
                .product(name: "Collections", package: "swift-collections"),
                "AuroraEditorTextViewObjC"
            ]
        ),
        .target(
            name: "AuroraEditorTextViewObjC",
            publicHeadersPath: "include"
        ),
        .testTarget(
            name: "AuroraEditorTextViewTests",
            dependencies: [
                "AuroraEditorTextView"
            ]
        ),
    ]
)
