//
//  Result+extensions.swift
//  
//
//  Created by Jeremy Bannister on 4/29/22.
//

///
public extension Result {
    
    ///
    var successfulValue: Success? {
        try? getSuccessfulValue()
    }
    
    ///
    func getSuccessfulValue () throws -> Success {
        switch self {
        case .success (let value): return value
        case .failure (let error): throw error
        }
    }
}
