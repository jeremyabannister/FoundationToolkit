//
//  Optional+extensions_tests.swift
//  
//
//  Created by Jeremy Bannister on 6/13/24.
//

///
extension Optional_tests {
    
    ///
    func test_assertEqual_to_toWithin() throws {
        try Double?.some(7.7)
            .assertEqual(to: 8, toWithin: 0.5)
        try Double?.none
            .assertEqual(to: nil, toWithin: 0.5)
    }
}
