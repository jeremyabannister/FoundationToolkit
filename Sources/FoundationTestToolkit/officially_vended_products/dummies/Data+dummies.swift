//
//  Data+dummies.swift
//  
//
//  Created by Jeremy Bannister on 12/8/21.
//

///
public extension Data {
    
    ///
    static var text_helloWorld: Self {
        String
            .helloWorld
            .data(using: .utf8)!
    }
    
    ///
    static var text_testing123: Self {
        String
            .testing123
            .data(using: .utf8)!
    }
}
