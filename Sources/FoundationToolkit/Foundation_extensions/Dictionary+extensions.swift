//
//  Dictionary+extensions.swift
//
//
//  Created by Jeremy Bannister on 7/29/24.
//

///
extension Dictionary {
    
    ///
    public func mapKeys<
        NewKey: Hashable
    >(
        _ keyTransform: (Key)throws->NewKey
    ) rethrows -> [NewKey: Value] {
        
        ///
        try self
            .reduce(into: .init(minimumCapacity: self.count)) {
                
                ///
                let newKey = try keyTransform($1.key)
                
                ///
                $0[newKey] = $1.value
            }
    }
}

///
extension Dictionary {
    
    ///
    public func compactMapKeys<
        NewKey: Hashable
    >(
        _ keyTransform: (Key)throws->NewKey?
    ) rethrows -> [NewKey: Value] {
        
        ///
        try self
            .reduce(into: .init(minimumCapacity: self.count)) {
                
                ///
                guard let newKey = try keyTransform($1.key) else { return }
                
                ///
                $0[newKey] = $1.value
            }
    }
}
