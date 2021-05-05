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
        .library(
            name: "UICatalogFeature",
            type: .dynamic,
            targets: [
                "UICatalogFeature",
            ]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/grpc/grpc-swift", .exact("1.0.0")),
        .package(url: "https://github.com/kean/Nuke", .exact("9.5.0")),
        .package(url: "https://github.com/pointfreeco/swift-composable-architecture", .exact("0.17.0")),
        .package(name: "Firebase", url: "https://github.com/firebase/firebase-ios-sdk.git", .branch("7.0-spm-beta")),
        .package(name: "Lottie", url: "https://github.com/airbnb/lottie-ios.git", .exact("3.2.1")),
        .package(name: "Playbook", url: "https://github.com/taoshotaro/playbook-ios", .branch("remove-valid-archs")),
    ],
    targets: [
        // target
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
        .target(
            name: "Auth",
            dependencies: [
                .product(name: "FirebaseAuth", package: "Firebase"),
            ]),
        .target(
            name: "ImageLoader",
            dependencies: [
                .product(name: "Nuke", package: "Nuke"),
            ]),
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
        .target(
            name: "Styleguide",
            dependencies: [
                .target(name: "Utility"),
            ]),
        .target(
            name: "UICatalogFeature",
            dependencies: [
                .product(name: "Playbook", package: "Playbook"),
                .product(name: "PlaybookUI", package: "Playbook"),
            ]
        ),
        .target(
            name: "Utility",
            dependencies: []),
        // testTarget
        .testTarget(
            name: "AppFeatureTests",
            dependencies: ["AppFeature"]),
        .testTarget(
            name: "AuthTests",
            dependencies: ["Auth"]),
        .testTarget(
            name: "ImageLoaderTests",
            dependencies: ["ImageLoader"]),
        .testTarget(
            name: "RepositoryTests",
            dependencies: ["Repository"]),
        .testTarget(
            name: "UtilityTests",
            dependencies: ["Utility"]),
    ]
)
