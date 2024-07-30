// swift-tools-version:5.7

///
import PackageDescription

///
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
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/Collection-sorted-by-KeyPath",
            "0.1.1" ..< "0.2.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/CollectionConcurrencyKit",
            "0.2.4" ..< "0.3.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/Data-humanReadableDescription",
            "0.1.1" ..< "0.2.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/Data-utf8String",
            "0.1.1" ..< "0.2.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/Dummy-package",
            "0.1.0" ..< "0.2.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/EmptyCodable-package",
            "0.1.0" ..< "0.2.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/ErrorMessage-package",
            "0.1.0" ..< "0.2.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/HasCustomUUIDType-package",
            "0.1.0" ..< "0.2.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/JSONToolkit",
            "0.2.0" ..< "0.3.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/ValueType-package",
            "0.1.4" ..< "0.2.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/RandomlyGeneratable-package",
            "0.1.0" ..< "0.2.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/ReferenceType-package",
            "0.1.0" ..< "0.2.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/Sequence-asArray",
            "0.1.1" ..< "0.2.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/String-utf8Data",
            "0.1.1" ..< "0.2.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/subscript-collection-safely",
            "0.1.3" ..< "0.2.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/VerboseEquatable-package",
            "0.1.0" ..< "0.2.0"
        ),
    ],
    targets: [
        
        ///
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
        
        ///
        .target(
            name: "FoundationTestToolkit",
            dependencies: [
                
                ///
                "FoundationToolkit",
                
                ///
                .product(
                    name: "ValueTypeTestToolkit",
                    package: "ValueType-package"
                ),
                
                ///
                .product(
                    name: "ReferenceTypeTestToolkit",
                    package: "ReferenceType-package"
                ),
            ]
        ),
        
        ///
        .testTarget(
            name: "FoundationToolkit-tests",
            dependencies: [
                "FoundationTestToolkit",
            ]
        ),
        
        ///
        .testTarget(
            name: "FoundationTestToolkit-tests",
            dependencies: [
                "FoundationTestToolkit",
            ]
        ),
    ]
)
