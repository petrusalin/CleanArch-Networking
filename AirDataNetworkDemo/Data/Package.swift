// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// Layer that gets the data from a source and adapts it to the app domain
let package = Package(
    name: "Data",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Data",
            targets: ["Data"]),
    ],
    dependencies: [
        .package(path: "../Domain"),
        .package(path: "../Models"),
        .package(path: "../../Projects/AirDataNetwork")
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Data",
            dependencies: [
                          .product(name: "Domain", package: "Domain"),
                          .product(name: "Models", package: "Models"),
                          .product(name: "AirDataNetwork", package: "AirDataNetwork"),
            ]),
        .testTarget(
            name: "DataTests",
            dependencies: ["Data"]),
    ]
)
