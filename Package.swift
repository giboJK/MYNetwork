// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MYNetwork",
    platforms: [.iOS("15.0"), .macOS("10.15.0")],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "MYNetwork",
            targets: ["MYNetwork"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire",
                 from: Version(stringLiteral: "5.7.1")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "MYNetwork",
            dependencies: ["Alamofire"]),
        .testTarget(
            name: "MYNetworkTests",
            dependencies: ["MYNetwork"]),
    ]
)
