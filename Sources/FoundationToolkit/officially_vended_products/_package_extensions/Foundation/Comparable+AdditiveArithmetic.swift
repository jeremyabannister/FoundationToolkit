//
//  Comparable+AdditiveArithmetic.swift
//  
//
//  Created by Jeremy Bannister on 12/11/21.
//

///
public extension Comparable where Self: AdditiveArithmetic {
    
    ///
    func isNotEqual (to other: Self, toWithin tolerance: Self) -> Bool {
        self.doesNotEqual(other, toWithin: tolerance)
    }
    
    ///
    func doesNotEqual (_ other: Self, toWithin tolerance: Self) -> Bool {
        !self.equals(other, toWithin: tolerance)
    }
    
    ///
    func isEqual (to other: Self, toWithin tolerance: Self) -> Bool {
        self.equals(other, toWithin: tolerance)
    }
    
    ///
    func equals (_ other: Self, toWithin tolerance: Self) -> Bool {
        self > other
            ? self - other <= tolerance
            : other - self <= tolerance
    }
}
