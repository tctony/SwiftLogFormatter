// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftLogFormatter",
    products: [
        .library(
            name: "LogFormatter",
            targets: ["LogFormatter"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-log.git", from: "1.0.0"),
    ],
    targets: [
        .target(
            name: "LogFormatter",
            dependencies: [
                .product(name: "Logging", package: "swift-log"),
            ]
        ),
        .testTarget(
            name: "SwiftLogFormatterTests",
            dependencies: [
                "LogFormatter",
            ]
        ),
    ]
)
