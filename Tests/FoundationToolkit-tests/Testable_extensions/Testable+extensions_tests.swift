//
//  Testable+extensions_tests.swift
//  
//
//  Created by Jeremy Bannister on 6/13/24.
//

///
extension SupportsArbitraryAssertions_tests {
    
    ///
    func test_assertEqual_to_toWithin() throws {
        try 8.2
            .assertEqual(to: 9, toWithin: 1.0)
        try 7.2.assertEqual(to: 7.2, toWithin: 0)
    }
}
