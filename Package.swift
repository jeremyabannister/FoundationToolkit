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
            url: "https://github.com/jeremyabannister/ErrorMessage",
            from: "0.1.1"
        ),
        .package(
            url: "https://github.com/jeremyabannister/ProperValueType",
            from: "0.1.0"
        ),
        .package(
            url: "https://github.com/jeremyabannister/ReferenceType",
            from: "0.1.1"
        ),
        .package(
            url: "https://github.com/jeremyabannister/VerboseEquatable",
            from: "0.1.4"
        ),
    ],
    targets: [
        .target(
            name: "FoundationToolkit",
            dependencies: [
                "ErrorMessage",
                "ProperValueType",
                "ReferenceType"
            ]
        ),
        .target(
            name: "FoundationTestToolkit",
            dependencies: [
                "FoundationToolkit",
                .product(name: "ProperValueTypeTestToolkit", package: "ProperValueType"),
                .product(name: "ReferenceTypeTestToolkit", package: "ReferenceType"),
                .product(name: "VerboseEquatableTestToolkit", package: "VerboseEquatable"),
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
