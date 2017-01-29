import PackageDescription

let package = Package(
    name: "SwinjectAutoregistration",
    dependencies: [
        .Package(url: "https://github.com/Swinject/Swinject.git", majorVersion: 2)
    ]
)