//
//  RangeReplaceableCollection+extensions.swift
//  
//
//  Created by Jeremy Bannister on 12/9/21.
//

///
public extension RangeReplaceableCollection {
    
    ///
    subscript (safely index: Index) -> Element? {
        guard self.hasIndex(index) else { return nil }
        return self[index]
    }
}
