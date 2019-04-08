// swift-tools-version:4.0

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
        .package(url: "https://github.com/kylef/Commander.git", .upToNextMinor(from: "0.8.0")),
    ],
    targets: [
        .target(
            name: "ignorio",
            dependencies: ["IgnorioKit", "Commander"]),
        .target(
            name: "IgnorioKit"),
        .testTarget(
            name: "IgnorioKitTests",
            dependencies: ["IgnorioKit"]
        )
    ]
)
