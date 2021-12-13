//
//  BidirectionalCollection+extensions.swift
//  
//
//  Created by Jeremy Bannister on 12/9/21.
//

///
public extension BidirectionalCollection {
    
    ///
    func forEachWithIndex (_ body: (Index, Element)throws->()) rethrows {
        try self.indices.forEach { index in
            try body(index, self[index])
        }
    }
    
    ///
    func reduceWithIndex <Result> (into initialValue: Result,
                          _ updateAccumulatingResult: (inout Result,
                                                       Index,
                                                       Element)throws->()) rethrows -> Result {
        try self.indices.reduce(into: initialValue) { result, index in
            try updateAccumulatingResult(&result, index, self[index])
        }
    }
    
    ///
    func mapWithIndex <NewElement> (_ transform: (Index, Element)->NewElement) -> [NewElement] {
        self.indices.map { index in
            transform(index, self[index])
        }
    }
    
    ///
    func compactMapWithIndex <NewElement> (_ transform: (Index, Element)->NewElement?) -> [NewElement] {
        self.indices.compactMap { index in
            transform(index, self[index])
        }
    }
}
