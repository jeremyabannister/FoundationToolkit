//
//  Dictionary_Keys+extensions.swift
//  
//
//  Created by Jeremy Bannister on 12/19/21.
//

///
extension Dictionary.Keys: Hashable {
    
    ///
    public func hash (into hasher: inout Hasher) {
        hasher.combine(Set(self))
    }
}
