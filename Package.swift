// swift-tools-version:5.1

import PackageDescription

let package = Package(
    name: "ignorio",
    products: [
        .executable(
            name: "ignorio",
            targets: ["ignorio"]),
        .library(
            name: "IgnorioKit",
            targets: ["IgnorioKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", from: "0.0.1"),
    ],
    targets: [
        .target(
            name: "ignorio",
            dependencies: ["IgnorioKit", "ArgumentParser"]),
        .target(
            name: "IgnorioKit"),
        .testTarget(
            name: "IgnorioKitTests",
            dependencies: ["IgnorioKit"]
        )
    ]
)
