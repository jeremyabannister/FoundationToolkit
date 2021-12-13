//
//  Testable+extensions.swift
//  
//
//  Created by Jeremy Bannister on 12/13/21.
//

///
public extension Optional
    where Wrapped: Testable,
          Wrapped: Comparable,
          Wrapped: AdditiveArithmetic {
    
    ///
    @discardableResult
    func assertEqual (to other: Self, toWithin tolerance: Wrapped) throws -> Self {
        switch (self, other) {
        case (nil, nil): break
        case (.some (let a), .some (let b)):
            try a.assertEqual(to: b, toWithin: tolerance)
        default:
            throw ErrorMessage("Values are not equal because one is nil and the other is not.")
        }
        return self
    }
}

///
public extension Testable where Self: Comparable & AdditiveArithmetic {
    
    ///
    @discardableResult
    func assertEqual (to other: Self, toWithin tolerance: Self) throws -> Self {
        
        ///
        if !self.equals(other, toWithin: tolerance) {
            throw ErrorMessage("\(self) is not equal to \(other) to within \(tolerance).")
        }
        
        ///
        return self
    }
}

///
public extension Testable {
    
    ///
    @discardableResult
    func assert
    <Value: Comparable & AdditiveArithmetic & Testable>
    (_ keyPath: KeyPath<Self, Value?>,
     equals value: Value,
     toWithin tolerance: Value) throws
    -> Self {
        
        ///
        guard let selfValue = self[keyPath: keyPath] else {
            throw ErrorMessage("nil is not equal to \(value).")
        }
        
        ///
        try _assert(
            selfValue,
            equals: value,
            toWithin: tolerance
        )
        
        ///
        return self
    }
}

///
public extension Testable {
    
    ///
    @discardableResult
    func assert
    <Value: Comparable & AdditiveArithmetic>
    (_ keyPath: KeyPath<Self, Value>,
     equals value: Value,
     toWithin tolerance: Value) throws
    -> Self {
        
        ///
        try _assert(
            self[keyPath: keyPath],
            equals: value,
            toWithin: tolerance
        )
        
        ///
        return self
    }
}

///
fileprivate func _assert
<Value: Comparable & AdditiveArithmetic>
(_ value: Value,
 equals otherValue: Value,
 toWithin tolerance: Value)
throws {
    
    if !value.equals(otherValue, toWithin: tolerance) {
        throw ErrorMessage(
            "\(value) is not equal to \(otherValue) to within \(tolerance)."
        )
    }
}
