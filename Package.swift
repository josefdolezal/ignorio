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
        .package(url: "https://github.com/antitypical/Result.git", .upToNextMinor(from: "3.2.4"))
    ],
    targets: [
        .target(
            name: "ignorio",
            dependencies: ["IgnorioKit", "Result", "Commander"]),
        .target(
            name: "IgnorioKit",
            dependencies: ["Result"])
    ]
)
