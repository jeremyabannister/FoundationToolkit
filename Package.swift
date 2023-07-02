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
            from: "0.1.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/CollectionConcurrencyKit",
            from: "0.2.2"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/Data-humanReadableDescription",
            from: "0.1.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/Data-utf8String",
            from: "0.1.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/DummyModule",
            from: "0.1.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/EmptyCodableModule",
            from: "0.1.4"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/ErrorMessage-module",
            from: "0.1.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/HasCustomUUIDType-module",
            "0.2.0" ..< "0.3.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/JSONToolkit",
            from: "0.1.2"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/NOTDONE",
            from: "0.1.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/ProperValueType-module",
            "0.1.2" ..< "0.2.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/RandomlyGeneratable-module",
            from: "0.1.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/ReferenceType-module",
            from: "0.1.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/RetroactiveConformance-Dictionary-Error",
            from: "0.1.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/Sequence-asArray",
            from: "0.1.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/String-utf8Data",
            from: "0.1.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/subscript-collection-safely",
            from: "0.1.1"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/VerboseEquatable-module",
            from: "0.1.0"
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
                "DummyModule",
                "ErrorMessage-module",
                "EmptyCodableModule",
                "HasCustomUUIDType-module",
                "JSONToolkit",
                "NOTDONE",
                "ProperValueType-module",
                "RandomlyGeneratable-module",
                "ReferenceType-module",
                "RetroactiveConformance-Dictionary-Error",
                "Sequence-asArray",
                "String-utf8Data",
                "subscript-collection-safely",
                "VerboseEquatable-module",
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
                    name: "ProperValueTypeTestToolkit",
                    package: "ProperValueType-module"
                ),
                
                ///
                .product(
                    name: "ReferenceTypeTestToolkit",
                    package: "ReferenceType-module"
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
