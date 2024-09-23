// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "RelativeDateFormat",
    defaultLocalization: "en",
    platforms: [.iOS(.v17)],
    products: [
        .library(
            name: "RelativeDateFormat",
            targets: ["RelativeDateFormat"]
        ),
    ],
    targets: [
        .target(
            name: "RelativeDateFormat"
        ),
        .testTarget(
            name: "RelativeDateFormatTests",
            dependencies: ["RelativeDateFormat"]
        ),
    ]
)
