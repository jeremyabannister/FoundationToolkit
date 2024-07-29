//
//  Dictionary_Keys+extensions.swift
//  
//
//  Created by Jeremy Bannister on 12/19/21.
//

///
extension Dictionary {
    
    /// Write all keys and values from otherDict into the receiver, overwriting previous key-value pairs which collide.
    public mutating func pasteIn(
        _ otherDict: Self
    ) {
        
        ///
        otherDict.forEach { self[$0] = $1 }
    }
    
    /// Write all keys and values from otherDict into a copy of the receiver, overwriting previous key-value pairs which collide, and return the result
    public func pastingIn(
        _ otherDict: Self
    ) -> Self {
        
        ///
        var copy = self
        copy.pasteIn(otherDict)
        return copy
    }
}

///
extension Dictionary {
    
    ///
    public func ensuringAndMutatingValue(
        forKey key: Key,
        defaultValue: Value,
        mutation: (inout Value)throws->()
    ) rethrows -> Self {
        
        ///
        try self.mutated {
            try $0.ensureAndMutateValue(
                forKey: key,
                defaultValue: defaultValue,
                mutation: mutation
            )
        }
    }
    
    ///
    public mutating func ensureAndMutateValue(
        forKey key: Key,
        defaultValue: Value,
        mutation: (inout Value)throws->()
    ) rethrows {
        
        ///
        var currentValue = self[key] ?? defaultValue
        try mutation(&currentValue)
        self[key] = currentValue
    }
}

///
extension Dictionary {
    
    ///
    public mutating func ensureAndReturnValue(
        forKey key: Key,
        defaultValue: Value
    ) -> Value {
        
        ///
        self.ensureValue(
            forKey: key,
            defaultValue: defaultValue
        )
        
        ///
        return self[key] ?? defaultValue
    }
}

///
extension Dictionary {
    
    ///
    public func ensuringValue(
        forKey key: Key,
        defaultValue: Value
    ) -> Self {
        
        ///
        self
            .mutated {
                $0.ensureValue(
                    forKey: key,
                    defaultValue: defaultValue
                )
            }
    }
    
    ///
    public mutating func ensureValue(
        forKey key: Key,
        defaultValue: Value
    ) {
        
        ///
        if self[key].isNil {
            self[key] = defaultValue
        }
    }
}

///
extension Dictionary.Keys: Hashable {
    
    ///
    public func hash(
        into hasher: inout Hasher
    ) {
        
        ///
        hasher.combine(Set(self))
    }
}
