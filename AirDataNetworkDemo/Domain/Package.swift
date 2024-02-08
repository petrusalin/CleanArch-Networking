// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

// Domain specific entities that will be consumed by the presentation and interfaces to fetch them
// A repository can be anything, can use an API, can go to a core data service, or a local datasource
let package = Package(
    name: "Domain",
    platforms: [.iOS(.v16)],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Domain",
            targets: ["Domain"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Domain"),
        .testTarget(
            name: "DomainTests",
            dependencies: ["Domain"]),
    ]
)
