// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "SwinjectAutoregistration",
    products: [
        .library(
            name: "SwinjectAutoregistration",
            targets: ["SwinjectAutoregistration"])
    ],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.6.0"),
    ],
    targets: [
        .target(
            name: "SwinjectAutoregistration",
            dependencies: [
                "Swinject",
            ],
            path: "Sources"),
    ]
)
