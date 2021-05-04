// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "AppPackage",
    platforms: [
        .iOS(.v14),
    ],
    products: [
        .library(
            name: "AppFeature",
            type: .dynamic,
            targets: ["AppFeature"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/kean/Nuke", .exact("9.5.0")),
        .package(url: "https://github.com/grpc/grpc-swift", .exact("1.0.0")),
        .package(name: "Firebase", url: "https://github.com/firebase/firebase-ios-sdk.git", .branch("7.0-spm-beta")),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", .exact("0.17.0")),
        .package(name: "Lottie", url: "https://github.com/airbnb/lottie-ios.git", .exact("3.2.1")),
    ],
    targets: [
        .target(
            name: "Auth",
            dependencies: [
                .product(name: "FirebaseAuth", package: "Firebase"),
            ]),
        .testTarget(
            name: "AuthTests",
            dependencies: ["Auth"]),
        .target(
            name: "AppFeature",
            dependencies: [
                .target(name: "ImageLoader"),
                .target(name: "Utility"),
                .product(name: "Lottie", package: "Lottie"),
                .product(name: "ComposableArchitecture", package: "swift-composable-architecture"),
            ],
            resources: [
                .process("Resources/"),
            ]
        ),
        .testTarget(
            name: "AppFeatureTests",
            dependencies: ["AppFeature"]),
        .target(
            name: "ImageLoader",
            dependencies: [
                .product(name: "Nuke", package: "Nuke"),
            ]),
        .testTarget(
            name: "ImageLoaderTests",
            dependencies: ["ImageLoader"]),
        .target(
            name: "Proto",
            dependencies: [
                .product(name: "GRPC", package: "grpc-swift"),
            ]),
        .target(
            name: "Repository",
            dependencies: [
                .product(name: "GRPC", package: "grpc-swift"),
                .target(name: "Proto"),
            ]),
        .testTarget(
            name: "RepositoryTests",
            dependencies: ["Repository"]),
        .target(
            name: "Utility",
            dependencies: []),
        .testTarget(
            name: "UtilityTests",
            dependencies: ["Utility"]),
    ]
)
