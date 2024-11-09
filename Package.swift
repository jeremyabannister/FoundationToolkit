// swift-tools-version:6.0

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
            url: "https://github.com/jeremyabannister/Collection-sorted-by-KeyPath",
            .upToNextMinor(from: "0.1.2")
        ),
        .package(
            url: "https://github.com/jeremyabannister/CollectionConcurrencyKit",
            .upToNextMinor(from: "0.2.5")
        ),
        .package(
            url: "https://github.com/jeremyabannister/Data-humanReadableDescription",
            .upToNextMinor(from: "0.1.2")
        ),
        .package(
            url: "https://github.com/jeremyabannister/Data-utf8String",
            .upToNextMinor(from: "0.1.2")
        ),
        .package(
            url: "https://github.com/jeremyabannister/Dummy-package",
            .upToNextMinor(from: "0.1.1")
        ),
        .package(
            url: "https://github.com/jeremyabannister/EmptyCodable-package",
            .upToNextMinor(from: "0.1.1")
        ),
        .package(
            url: "https://github.com/jeremyabannister/ErrorMessage-package",
            .upToNextMinor(from: "0.1.2")
        ),
        .package(
            url: "https://github.com/jeremyabannister/HasCustomUUIDType-package",
            .upToNextMinor(from: "0.1.1")
        ),
        .package(
            url: "https://github.com/jeremyabannister/JSONToolkit",
            .upToNextMinor(from: "0.2.1")
        ),
        .package(
            url: "https://github.com/jeremyabannister/ValueType-package",
            .upToNextMinor(from: "0.1.5")
        ),
        .package(
            url: "https://github.com/jeremyabannister/RandomlyGeneratable-package",
            .upToNextMinor(from: "0.1.1")
        ),
        .package(
            url: "https://github.com/jeremyabannister/ReferenceType-package",
            .upToNextMinor(from: "0.1.1")
        ),
        .package(
            url: "https://github.com/jeremyabannister/Sequence-asArray",
            .upToNextMinor(from: "0.1.2")
        ),
        .package(
            url: "https://github.com/jeremyabannister/String-utf8Data",
            .upToNextMinor(from: "0.1.2")
        ),
        .package(
            url: "https://github.com/jeremyabannister/subscript-collection-safely",
            .upToNextMinor(from: "0.1.4")
        ),
        .package(
            url: "https://github.com/jeremyabannister/VerboseEquatable-package",
            .upToNextMinor(from: "0.1.1")
        ),
    ],
    targets: [
        .target(
            name: "FoundationToolkit",
            dependencies: [
                "Collection-sorted-by-KeyPath",
                "CollectionConcurrencyKit",
                "Data-humanReadableDescription",
                "Data-utf8String",
                .product(name: "Dummy-module", package: "Dummy-package"),
                .product(name: "ErrorMessage-module", package: "ErrorMessage-package"),
                .product(name: "EmptyCodable-module", package: "EmptyCodable-package"),
                .product(name: "HasCustomUUIDType-module", package: "HasCustomUUIDType-package"),
                "JSONToolkit",
                .product(name: "RandomlyGeneratable-module", package: "RandomlyGeneratable-package"),
                .product(name: "ReferenceType-module", package: "ReferenceType-package"),
                "Sequence-asArray",
                "String-utf8Data",
                "subscript-collection-safely",
                .product(name: "ValueType-module", package: "ValueType-package"),
                .product(name: "VerboseEquatable-module", package: "VerboseEquatable-package"),
            ]
        ),
        .target(
            name: "FoundationTestToolkit",
            dependencies: [
                "FoundationToolkit",
                .product(
                    name: "ValueTypeTestToolkit",
                    package: "ValueType-package"
                ),
                .product(
                    name: "ReferenceTypeTestToolkit",
                    package: "ReferenceType-package"
                ),
            ]
        ),
        .testTarget(
            name: "FoundationToolkit-tests",
            dependencies: [
                "FoundationTestToolkit",
            ]
        ),
        .testTarget(
            name: "FoundationTestToolkit-tests",
            dependencies: [
                "FoundationTestToolkit",
            ]
        ),
    ]
)
