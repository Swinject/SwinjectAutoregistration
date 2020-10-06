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
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.7.1"),
        .package(url: "https://github.com/Quick/Quick", from: "3.0.0"),
        .package(url: "https://github.com/Quick/Nimble", from: "9.0.0")
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
                "Quick",
                "Nimble",
                "Swinject",
                "SwinjectAutoregistration",
            ])
    ]
)
