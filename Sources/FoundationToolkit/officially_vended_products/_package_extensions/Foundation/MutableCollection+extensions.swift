//
//  MutableCollection+extensions.swift
//  
//
//  Created by Jeremy Bannister on 12/9/21.
//

// MARK: - mutate(where:mutation:)

///
public extension MutableCollection {
    
    ///
    mutating func mutate
        (where predicate: (Element)->Bool,
         _ mutation: (inout Element)->()) {
        
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
}


// MARK: - mutate(at:_:)

///
public extension MutableCollection {
    
    ///
    mutating func mutate
        (at index: Index,
         _ mutation: (inout Element)->()) {
        
        ///
        var copy = self[index]
        mutation(&copy)
        self[index] = copy
    }
}


// MARK: - mutateLast

///
public extension MutableCollection where Self: BidirectionalCollection {
    
    ///
    func mutatingLast (_ mutation: (inout Element)->()) -> Self {
        var copy = self
        copy.mutateLast(mutation)
        return copy
    }
    
    ///
    mutating func mutateLast (_ mutation: (inout Element)->()) {
        guard var last = self.last else { return }
        mutation(&last)
        self[self.index(before: self.endIndex)] = last
    }
}


// MARK: - mutateFirst

///
public extension MutableCollection {
    
    ///
    func mutatingFirst (_ mutation: (inout Element)->()) -> Self {
        var copy = self
        copy.mutateFirst(mutation)
        return copy
    }
    
    ///
    mutating func mutateFirst (_ mutation: (inout Element)->()) {
        guard var first = self.first else { return }
        mutation(&first)
        self[startIndex] = first
    }
}
