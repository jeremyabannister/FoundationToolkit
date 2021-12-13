//
//  Testable+extensions_tests.swift
//  
//
//  Created by Jeremy Bannister on 12/13/21.
//

///
extension Testable_tests {
    
    ///
    func test_assertEqual_to_toWithin () throws {
        try 8.2
            .assertEqual(to: 9, toWithin: 1.0)
        try 7.2.assertEqual(to: 7.2, toWithin: 0)
    }
}

///
extension Optional_tests {
    
    ///
    func test_assertEqual_to_toWithin () throws {
        try Double?.some(7.7)
            .assertEqual(to: 8, toWithin: 0.5)
        try Double?.none
            .assertEqual(to: nil, toWithin: 0.5)
    }
}
