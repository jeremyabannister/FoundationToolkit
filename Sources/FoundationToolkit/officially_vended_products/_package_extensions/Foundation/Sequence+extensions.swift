//
//  Sequence+extensions.swift
//  
//
//  Created by Jeremy Bannister on 12/9/21.
//

///
public extension Sequence where Element: Numeric {
    
    ///
    func product () -> Element {
        self.reduce(into: 1, *=)
    }
}
