// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "Tools",
    platforms: [
        .macOS(.v10_15),
    ],
    dependencies: [
        .package(url: "https://github.com/realm/SwiftLint", .exact("0.43.1")),
        .package(url: "https://github.com/nicklockwood/SwiftFormat", .exact("0.47.13")),
        .package(url: "https://github.com/grpc/grpc-swift", .exact("1.0.0")),
        .package(url: "https://github.com/taoshotaro/swift-mod.git", .branch("update-deps")),
    ],
    targets: [
    ]
)
