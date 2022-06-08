//
//  Double+extensions.swift
//  
//
//  Created by Jeremy Bannister on 6/8/22.
//

///
public extension Double {
    
    /// This method initializes and returns an `Int` by passing this `Double` to the initializer, or throws an error if that operation would fail.
    func asInt () throws -> Int {
        
        ///
        switch self {
        case .infinity,
             .greatestFiniteMagnitude:
            return .max
            
        case -.infinity,
             -.greatestFiniteMagnitude:
            return -.max
            
        case let x where x.isNaN:
            throw "Double.nan cannot be converted to Int.".asErrorMessage()
            
        case let x where x.isSignalingNaN:
            throw "Double.signalingNaN cannot be converted to Int.".asErrorMessage()
            
        default:
            return Int(self)
        }
    }
}
