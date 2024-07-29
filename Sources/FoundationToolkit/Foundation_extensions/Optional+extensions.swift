//
//  Optional+extensions.swift
//  
//
//  Created by Jeremy Bannister on 9/26/22.
//

///
extension Optional {
    
    ///
    public func ensuringAndMutating(
        defaultValue: Wrapped,
        mutation: (inout Wrapped)throws->()
    ) rethrows -> Wrapped {
        
        ///
        var value = self ?? defaultValue
        try mutation(&value)
        return value
    }
    
    ///
    public mutating func ensureAndMutate(
        defaultValue: Wrapped,
        mutation: (inout Wrapped)throws->()
    ) rethrows {
        
        ///
        var currentValue = self ?? defaultValue
        try mutation(&currentValue)
        self = currentValue
    }
}

///
extension Optional
    where Wrapped: Comparable,
          Wrapped: AdditiveArithmetic {
    
    ///
    @discardableResult
    public func assertEqual(
        to other: Self,
        toWithin tolerance: Wrapped
    ) throws -> Self {
        
        ///
        switch (self, other) {
            
        ///
        case (nil, nil): break
            
        ///
        case (.some (let a), .some (let b)):
            
            ///
            try a.assertEqual(to: b, toWithin: tolerance)
            
        ///
        default:
            
            ///
            throw ErrorMessage("Values are not equal because one is nil and the other is not.")
        }
        
        ///
        return self
    }
}
