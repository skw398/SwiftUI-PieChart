// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "PieChart",
    platforms: [
        .iOS(.v13),
        .macOS(.v10_15),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "PieChart",
            targets: ["PieChart"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "PieChart",
            dependencies: [])
    ]
)
