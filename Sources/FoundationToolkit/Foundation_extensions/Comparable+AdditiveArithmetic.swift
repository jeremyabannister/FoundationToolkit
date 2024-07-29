//
//  Comparable+AdditiveArithmetic.swift
//  
//
//  Created by Jeremy Bannister on 12/11/21.
//

///
extension Comparable where Self: AdditiveArithmetic {
    
    ///
    @discardableResult
    public func assertEqual(
        to other: Self,
        toWithin tolerance: Self
    ) throws -> Self {
        
        ///
        if !self.equals(other, toWithin: tolerance) {
            throw ErrorMessage("\(self) is not equal to \(other) to within \(tolerance).")
        }
        
        ///
        return self
    }
}

///
extension Comparable {
    
    ///
    public func clamped(
        to lowerBound: Self?,
        _ upperBound: Self?
    ) -> Self {
        
        ///
        guard self > lowerBound ?? self else { return lowerBound ?? self }
        guard self < upperBound ?? self else { return upperBound ?? self }
        return self
    }
    
    ///
    public func clamped(
        to limits: ClosedRange<Self>
    ) -> Self {
        
        ///
        self.clamped(
            to: limits.lowerBound,
            limits.upperBound
        )
    }
    
    ///
    public mutating func clamp(
        to lowerBound: Self?,
        _ upperBound: Self?
    ) {
        
        ///
        self = self.clamped(to: lowerBound, upperBound)
    }
    
    ///
    public mutating func clamp(
        to limits: ClosedRange<Self>
    ) {
        
        ///
        self = self.clamped(to: limits)
    }
}

///
extension Comparable where Self: AdditiveArithmetic {
    
    ///
    public func isNotEqual(
        to other: Self,
        toWithin tolerance: Self
    ) -> Bool {
        
        ///
        self.doesNotEqual(
            other,
            toWithin: tolerance
        )
    }
    
    ///
    public func doesNotEqual(
        _ other: Self,
        toWithin tolerance: Self
    ) -> Bool {
        
        ///
        !self.equals(
            other,
            toWithin: tolerance
        )
    }
    
    ///
    public func isEqual(
        to other: Self,
        toWithin tolerance: Self
    ) -> Bool {
        
        ///
        self.equals(
            other,
            toWithin: tolerance
        )
    }
    
    ///
    public func equals(
        _ other: Self,
        toWithin tolerance: Self
    ) -> Bool {
        
        ///
        self > other
            ? self - other <= tolerance
            : other - self <= tolerance
    }
}
