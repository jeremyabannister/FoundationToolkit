//
//  Collection+extensions.swift
//  
//
//  Created by Jeremy Bannister on 12/7/21.
//

///
public extension Collection where Element: Hashable {
    
    /// Any collection of hashable things can be turned into a Set
    func asSet () -> Set<Element> {
        return Set(self)
    }
}

///
public extension Collection where Element: Hashable {
    
    /// Creates a dictionary by iterating over all elements and mapping each one to a value, then storing that value in the new dictionary using the element as the key.
    ///
    /// - Parameter mapping: The transform function which takes in an element of the receiver and returns the corresponding value which should be stored in the new dictionary.
    func makeDictionary <Value> (_ valueMap: (Element)throws->Value) rethrows -> [Element: Value] {
        return try makeDictionary(key: { $0 }, value: valueMap)
    }
    
    ///
    func makeCompactDictionary <Value> (_ valueMap: (Element)throws->Value?) rethrows -> [Element: Value] {
        return try makeCompactDictionary(key: { $0 }, value: valueMap)
    }
}

///
public extension Collection {
    
    /// Returns a dictionary containing the elements of this collection, keyed by the hashable value found for each element at the given key path.
    func makeDictionary
        <Key: Hashable>
        (key keyPath: KeyPath<Element, Key>) -> [Key: Element] {
        
        ///
        self.makeDictionary(
            key: { $0[keyPath: keyPath] },
            value: { $0 }
        )
    }
    
    /// Returns a dictionary containing some of the elements of this collection, keyed by the hashable value found for each element at the given key path, if it was not nil.
    func makeDictionary
        <Key: Hashable>
        (key keyPath: KeyPath<Element, Key?>) -> [Key: Element] {
        
        ///
        self.makeCompactDictionary(
            key: { $0[keyPath: keyPath] },
            value: { $0 }
        )
    }
}

///
public extension Collection {
    
    /// Turn any Collection into a Dictionary by transforming each element into both a Key and a Value.
    func makeDictionary
        <Key: Hashable, Value>
        (key keyMap: (Element) throws -> Key,
         value valueMap: (Element) throws -> Value) rethrows -> [Key: Value] {
        
        ///
        try self.makeCompactDictionary(
            key: { try keyMap($0) },
            value: { try valueMap($0) }
        )
    }
    
    /// Turn any Collection into a Dictionary by transforming each element into both an optional key and an optional value. If either the key or the value is nil, nothing is added to the result and the element is skipped
    func makeCompactDictionary
        <Key: Hashable, Value>
        (key keyMap: (Element) throws -> Key?,
         value valueMap: (Element) throws -> Value?) rethrows -> [Key: Value] {
        
        ///
        try self.reduce(into: .init(minimumCapacity: self.count)) { dictionary, element in
            
            ///
            guard let key = try keyMap(element) else { return }
            
            ///
            try dictionary[key] = valueMap(element)
        }
    }
}

///
public extension Collection {
    
    ///
    func hasIndex (_ index: Index) -> Bool {
        self.indices.contains(index)
    }
    
    /// Returns the only element in the collection if the collection has exactly 1 element, otherwise returns nil.
    var only: Element? {
        guard self.count == 1 else { return nil }
        return self.first
    }
}
