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
public extension Dictionary {
    
    ///
    func ensuringAndMutatingValue
        (forKey key: Key,
         defaultValue: Value,
         mutation: (inout Value)throws->())
    rethrows -> Self {
        
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
    mutating func ensureAndMutateValue
        (forKey key: Key,
         defaultValue: Value,
         mutation: (inout Value)throws->())
    rethrows {
        
        ///
        var currentValue = self[key] ?? defaultValue
        try mutation(&currentValue)
        self[key] = currentValue
    }
}

///
public extension Dictionary {
    
    ///
    mutating func ensureAndReturnValue
        (forKey key: Key,
         defaultValue: Value)
    -> Value {
        
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
public extension Dictionary {
    
    ///
    func ensuringValue
        (forKey key: Key,
         defaultValue: Value)
    -> Self {
        
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
    mutating func ensureValue
        (forKey key: Key,
         defaultValue: Value) {
        
        ///
        if self[key].isNil {
            self[key] = defaultValue
        }
    }
}

///
extension Dictionary.Keys: Hashable {
    
    ///
    public func hash (into hasher: inout Hasher) {
        hasher.combine(Set(self))
    }
}
