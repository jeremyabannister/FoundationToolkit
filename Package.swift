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
            .upToNextMinor(from: "0.1.0")
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/CollectionConcurrencyKit",
            .upToNextMinor(from: "0.2.2")
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/Data-humanReadableDescription",
            .upToNextMinor(from: "0.1.0")
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/Data-utf8String",
            .upToNextMinor(from: "0.1.0")
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/DummyModule",
            .upToNextMinor(from: "0.1.0")
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/EmptyCodableModule",
            .upToNextMinor(from: "0.1.4")
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/ErrorMessage-module",
            .upToNextMinor(from: "0.1.0")
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/HasCustomUUIDType-module",
            .upToNextMinor(from: "0.2.1")
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/JSONToolkit",
            .upToNextMinor(from: "0.1.2")
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/NOTDONE",
            .upToNextMinor(from: "0.1.0")
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/ProperValueType-module",
            .upToNextMinor(from: "0.1.3")
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/RandomlyGeneratable-module",
            .upToNextMinor(from: "0.1.0")
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/ReferenceType-module",
            .upToNextMinor(from: "0.1.0")
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/RetroactiveConformance-Dictionary-Error",
            .upToNextMinor(from: "0.1.0")
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/Sequence-asArray",
            .upToNextMinor(from: "0.1.0")
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/String-utf8Data",
            .upToNextMinor(from: "0.1.0")
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/subscript-collection-safely",
            .upToNextMinor(from: "0.1.1")
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/VerboseEquatable-module",
            .upToNextMinor(from: "0.1.0")
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
