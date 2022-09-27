//
//  Optional+extensions.swift
//  
//
//  Created by Jeremy Bannister on 9/26/22.
//

///
public extension Optional {
    
    ///
    func ensuringAndMutating
        (defaultValue: Wrapped,
         mutation: (inout Wrapped)throws->())
    rethrows -> Wrapped {
        
        ///
        var value = self ?? defaultValue
        try mutation(&value)
        return value
    }
    
    ///
    mutating func ensureAndMutate
        (defaultValue: Wrapped,
         mutation: (inout Wrapped)throws->())
    rethrows {
        
        ///
        var currentValue = self ?? defaultValue
        try mutation(&currentValue)
        self = currentValue
    }
}
