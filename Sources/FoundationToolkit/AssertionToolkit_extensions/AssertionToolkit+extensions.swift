//
//  AssertionToolkit+extensions.swift
//
//
//  Created by Jeremy Bannister on 12/13/21.
//

///
extension SupportsArbitraryAssertions {
    
    ///
    @discardableResult
    public func assert<
        Value: Comparable & AdditiveArithmetic
    >(
        _ keyPath: KeyPath<Self, Value?>,
        equals value: Value,
        toWithin tolerance: Value
    ) throws -> Self {
        
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
extension SupportsArbitraryAssertions {
    
    ///
    @discardableResult
    public func assert<
        Value: Comparable & AdditiveArithmetic
    >(
        _ keyPath: KeyPath<Self, Value>,
        equals value: Value,
        toWithin tolerance: Value
    ) throws -> Self {
        
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
private func _assert<
    Value: Comparable & AdditiveArithmetic
>(
    _ value: Value,
    equals otherValue: Value,
    toWithin tolerance: Value
) throws {
    
    ///
    if !value.equals(otherValue, toWithin: tolerance) {
        
        ///
        throw ErrorMessage(
            "\(value) is not equal to \(otherValue) to within \(tolerance)."
        )
    }
}
