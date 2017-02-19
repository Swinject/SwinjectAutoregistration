import PackageDescription

let package = Package(
    name: "SwinjectAutoregistration",
    dependencies: [
        .Package(url: "https://github.com/Swinject/Swinject.git", majorVersion: 2),
        .Package(url: "https://github.com/Quick/Quick", majorVersion: 1),
        .Package(url: "https://github.com/Quick/Nimble", majorVersion: 5, minor: 1),
    ]
)
