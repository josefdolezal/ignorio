// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "ignorio",
    targets: [
        Target(
            name: "Ignorio",
            dependencies: ["IgnorioKit"]
        ),
        Target(name: "IgnorioKit")
    ],
    dependencies: [
        .Package(url: "https://github.com/kylef/Commander.git", majorVersion: 0, minor: 6),
    ]
)
