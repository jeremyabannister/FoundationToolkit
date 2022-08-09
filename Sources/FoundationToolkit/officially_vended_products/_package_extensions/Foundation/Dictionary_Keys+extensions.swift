//
//  Dictionary_Keys+extensions.swift
//  
//
//  Created by Jeremy Bannister on 12/19/21.
//

///
public extension Dictionary {
    
    /// Write all keys and values from otherDict into the receiver, overwriting previous key-value pairs which collide.
    mutating func pasteIn (_ otherDict: Self) {
        otherDict.forEach { self[$0] = $1 }
    }
    
    /// Write all keys and values from otherDict into a copy of the receiver, overwriting previous key-value pairs which collide, and return the result
    func pastingIn (_ otherDict: Self) -> Self {
        var copy = self
        copy.pasteIn(otherDict)
        return copy
    }
}

///
extension Dictionary.Keys: Hashable {
    
    ///
    public func hash (into hasher: inout Hasher) {
        hasher.combine(Set(self))
    }
}
