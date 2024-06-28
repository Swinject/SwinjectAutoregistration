// swift-tools-version:4.2

import PackageDescription

let package = Package(
    name: "SwinjectAutoregistration",
    products: [
        .library(
            name: "SwinjectAutoregistration",
            targets: ["SwinjectAutoregistration"])
    ],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.9.1")
    ],
    targets: [
        .target(
            name: "SwinjectAutoregistration",
            dependencies: [
                "Swinject",
            ],
            path: "Sources"),
        .testTarget(
            name: "SwinjectAutoregistrationTests",
            dependencies: [
                "Swinject",
                "SwinjectAutoregistration",
            ])
    ]
)
