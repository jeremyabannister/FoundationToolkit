// swift-tools-version:5.7

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
            from: "0.1.1"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/ErrorMessage",
            from: "0.1.1"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/JSONToolkit",
            from: "0.1.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/NOTDONE",
            from: "0.1.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/ProperValueType",
            from: "0.1.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/RandomlyGeneratableModule",
            from: "0.1.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/ReferenceType",
            from: "0.1.1"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/String-utf8Data",
            from: "0.1.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/subscript-collection-safely",
            from: "0.1.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/VerboseEquatable",
            from: "0.1.5"
        ),
    ],
    targets: [
        
        ///
        .target(
            name: "FoundationToolkit",
            dependencies: [
                
                ///
                "CollectionConcurrencyKit",
                
                ///
                "Data-humanReadableDescription",
                
                ///
                "Data-utf8String",
                
                ///
                "DummyModule",
                
                ///
                "ErrorMessage",
                
                ///
                "EmptyCodableModule",
                
                ///
                "JSONToolkit",
                
                ///
                "NOTDONE",
                
                ///
                "ProperValueType",
                
                ///
                "RandomlyGeneratableModule",
                
                ///
                "ReferenceType",
                
                ///
                "String-utf8Data",
                
                ///
                "subscript-collection-safely",
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
                    package: "ProperValueType"
                ),
                
                ///
                .product(
                    name: "ReferenceTypeTestToolkit",
                    package: "ReferenceType"
                ),
                
                ///
                .product(
                    name: "VerboseEquatableTestToolkit",
                    package: "VerboseEquatable"
                ),
            ]
        ),
        
        ///
        .testTarget(
            name: "FoundationToolkit-tests",
            dependencies: ["FoundationTestToolkit"]
        ),
        
        ///
        .testTarget(
            name: "FoundationTestToolkit-tests",
            dependencies: ["FoundationTestToolkit"]
        ),
    ]
)
