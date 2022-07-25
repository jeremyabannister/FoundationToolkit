//
//  Comparable+AdditiveArithmetic.swift
//  
//
//  Created by Jeremy Bannister on 12/11/21.
//

///
public extension Comparable {
    
    ///
    func clamped (to lowerBound: Self?, _ upperBound: Self?) -> Self {
        guard self > lowerBound ?? self else { return lowerBound ?? self }
        guard self < upperBound ?? self else { return upperBound ?? self }
        return self
    }
    
    ///
    func clamped (to limits: ClosedRange<Self>) -> Self {
        self.clamped(
            to: limits.lowerBound,
            limits.upperBound
        )
    }
    
    ///
    mutating func clamp (to lowerBound: Self?, _ upperBound: Self?) {
        self = self.clamped(to: lowerBound, upperBound)
    }
    
    ///
    mutating func clamp (to limits: ClosedRange<Self>) {
        self = self.clamped(to: limits)
    }
}

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
