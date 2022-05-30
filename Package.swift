// swift-tools-version:5.5

import PackageDescription

let package = Package(
    name: "ignorio",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "IgnorioKit",
            targets: ["IgnorioKit"])
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-argument-parser", .upToNextMinor(from: "1.1.2")),
    ],
    targets: [
        .executableTarget(name: "ignorio", dependencies: [
            "IgnorioKit", .product(name: "ArgumentParser", package: "swift-argument-parser")
        ]),
        .target(name: "IgnorioKit"),
        .testTarget(
            name: "IgnorioKitTests",
            dependencies: ["IgnorioKit"]
        )
    ]
)
