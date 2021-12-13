// swift-tools-version:5.4

import PackageDescription

let package = Package(
    name: "FoundationToolkit",
    products: [
        .library(
            name: "FoundationToolkit",
            targets: ["FoundationToolkit"]
        ),
        .library(
            name: "FoundationTestToolkit",
            targets: ["FoundationTestToolkit"]
        ),
    ],
    dependencies: [
        .package(
            url: "https://github.com/jeremyabannister/VerboseEquatable",
            from: "0.1.4"
        ),
        .package(
            url: "https://github.com/jeremyabannister/ProperValueType",
            from: "0.1.0"
        )
    ],
    targets: [
        .target(
            name: "FoundationToolkit",
            dependencies: []
        ),
        .target(
            name: "FoundationTestToolkit",
            dependencies: [
                "FoundationToolkit",
                .product(name: "VerboseEquatableTestToolkit", package: "VerboseEquatable"),
                .product(name: "ProperValueTypeTestToolkit", package: "ProperValueType")
            ]
        ),
        .testTarget(
            name: "FoundationToolkit-tests",
            dependencies: ["FoundationTestToolkit"]
        ),
        .testTarget(
            name: "FoundationTestToolkit-tests",
            dependencies: ["FoundationTestToolkit"]
        ),
    ]
)
