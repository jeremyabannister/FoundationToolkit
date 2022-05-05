//
//  Sequence+extensions.swift
//  
//
//  Created by Jeremy Bannister on 12/9/21.
//

///
public extension Sequence where Element: Numeric,
                                Element: _ExpressibleByBuiltinIntegerLiteral {
    
    ///
    func product () -> Element {
        self.reduce(into: .init(integerLiteral: 1)) { $0 *= $1 }
    }
}

///
public extension Sequence {
    
    /// This simply calls `self.map { $0 }` to forcibly convert this value to an `Array`.
    var asArray: Array<Element> {
        self.map { $0 }
    }
}
