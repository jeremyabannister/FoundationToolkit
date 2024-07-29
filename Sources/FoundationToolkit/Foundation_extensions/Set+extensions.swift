//
//  Set+extensions.swift
//  
//
//  Created by Jeremy Bannister on 8/23/22.
//

///
extension Set {
    
    ///
    public subscript(
        contains member: Element
    ) -> Bool {
        
        ///
        get { self.contains(member) }
        
        ///
        set {
            newValue
                ? (_ = self.insert(member))
                : (_ = self.remove(member))
        }
    }
}

///
extension Set {
    
    ///
    public func mapSet<
        NewElement: Hashable
    >(
        _ transform: (Element)throws->NewElement
    ) rethrows -> Set<NewElement> {
        
        ///
        try self
            .map(transform)
            .asSet()
    }
}
