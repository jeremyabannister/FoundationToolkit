//
//  Collection+extensions.swift
//  
//
//  Created by Jeremy Bannister on 12/7/21.
//

///
extension Collection where Element: Equatable {
    
    ///
    public func hasPrefix<
        C: Collection
    >(
        _ prefix: C
    ) -> Bool
    where C.Element == Self.Element {
        
        ///
        prefix
            .count
            .isLessThanOrEqual(to: self.count)
            .and(
                zip(self, prefix)
                    .allSatisfy { $0 == $1 }
            )
    }
}

///
extension Collection {
    
    ///
    public func hasIndex(
        _ index: Index
    ) -> Bool {
        
        ///
        self.indices.contains(index)
    }
    
    /// Returns the only element in the collection if the collection has exactly 1 element, otherwise returns nil.
    public var only: Element? {
        guard self.count == 1 else { return nil }
        return self.first
    }
}
