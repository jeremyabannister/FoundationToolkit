// swift-tools-version:5.5

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
            url: "https://github.com/jeremyabannister/EmptyCodableModule",
            from: "0.1.0"
        ),
        
        ///
        .package(
            url: "https://github.com/jeremyabannister/ErrorMessage",
            from: "0.1.1"
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
            url: "https://github.com/jeremyabannister/VerboseEquatable",
            from: "0.1.4"
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
                "ErrorMessage",
                
                ///
                "EmptyCodableModule",
                
                ///
                "NOTDONE",
                
                ///
                "ProperValueType",
                
                ///
                "RandomlyGeneratableModule",
                
                ///
                "ReferenceType",
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
