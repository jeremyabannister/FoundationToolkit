//
//  MutableCollection+extensions.swift
//  
//
//  Created by Jeremy Bannister on 12/9/21.
//

///
public extension MutableCollection {
    
    ///
    mutating func mutate
        (where predicate: (Element)->Bool,
         mutation: (inout Element)->()) {
        
        ///
        var copy = self
        for index in copy.indices {
            guard predicate(copy[index]) else { continue }
            var mutableElement = copy[index]
            mutation(&mutableElement)
            copy[index] = mutableElement
        }
        self = copy
    }
    
    ///
    mutating func mutate (at index: Index, _ mutation: (inout Element)->()) {
        var copy = self[index]
        mutation(&copy)
        self[index] = copy
    }
    
    ///
    mutating func mutateFirst (_ mutation: (inout Element)->()) {
        guard var first = self.first else { return }
        mutation(&first)
        self[startIndex] = first
    }
}
