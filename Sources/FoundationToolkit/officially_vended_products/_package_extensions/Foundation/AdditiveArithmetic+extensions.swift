//
//  AdditiveArithmetic+extensions.swift
//  
//
//  Created by Jeremy Bannister on 5/29/23.
//

///
extension AdditiveArithmetic where Self: Comparable {
    
    ///
    public var isPositive: Bool {
        self > .zero
    }
    
    ///
    public var isNegative: Bool {
        self < .zero
    }
}

///
extension AdditiveArithmetic {
    
    ///
    public var negated: Self {
        .zero - self
    }
}
