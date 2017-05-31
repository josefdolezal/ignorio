// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "ignorio",
    targets: [
        Target(
            name: "ignorio",
            dependencies: ["IgnorioKit"]
        ),
        Target(name: "IgnorioKit")
    ],
    dependencies: [
        .Package(url: "https://github.com/kylef/Commander.git", majorVersion: 0, minor: 6),
        .Package(url: "https://github.com/antitypical/Result.git", majorVersion: 3, minor: 2)
    ]
)
