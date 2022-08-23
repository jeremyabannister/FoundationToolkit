//
//  Set+extensions.swift
//  
//
//  Created by Jeremy Bannister on 8/23/22.
//

///
public extension Set {
    
    ///
    func mapSet
        <NewElement: Hashable>
        (_ transform: (Element)throws->NewElement)
    rethrows -> Set<NewElement> {
        
        ///
        try self
            .map(transform)
            .asSet()
    }
}
