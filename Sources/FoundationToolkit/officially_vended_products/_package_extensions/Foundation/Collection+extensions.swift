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
@available(iOS 13.0, macOS 10.15.0, *)
public extension Collection where Element: Hashable {
    
    ///
    func asyncMakeDictionary
        <Value>
        (_ valueMap: @escaping (Element)async throws->Value)
    async rethrows -> [Element: Value] {
        
        ///
        try await asyncMakeDictionary(key: { $0 }, value: valueMap)
    }
    
    ///
    func concurrentMakeDictionary
        <Value>
        (_ valueMap: @escaping (Element)async throws->Value)
    async rethrows -> [Element: Value] {
        
        ///
        try await concurrentMakeDictionary(key: { $0 }, value: valueMap)
    }
    
    ///
    func asyncMakeCompactDictionary
        <Value>
        (_ valueMap: (Element)async throws->Value?)
    async rethrows -> [Element: Value] {
        
        ///
        try await asyncMakeCompactDictionary(key: { $0 }, value: valueMap)
    }
    
    ///
    func concurrentMakeCompactDictionary
        <Value>
        (_ valueMap: (Element)async throws->Value?)
    async rethrows -> [Element: Value] {
        
        ///
        try await asyncMakeCompactDictionary(key: { $0 }, value: valueMap)
    }
}

///
@available(iOS 13.0, macOS 10.15.0, *)
public extension Collection {
    
    ///
    func asyncMakeDictionary
        <Key: Hashable, Value>
        (key keyMap: @escaping (Element) async throws -> Key,
         value valueMap: @escaping (Element) async throws -> Value)
    async rethrows -> [Key: Value] {
        
        ///
        try await self.asyncMakeCompactDictionary(
            key: { try await keyMap($0) },
            value: { try await valueMap($0) }
        )
    }
    
    ///
    func concurrentMakeDictionary
        <Key: Hashable, Value>
        (key keyMap: @escaping (Element) async throws -> Key,
         value valueMap: @escaping (Element) async throws -> Value)
    async rethrows -> [Key: Value] {
        
        ///
        try await self.concurrentMakeCompactDictionary(
            key: { try await keyMap($0) },
            value: { try await valueMap($0) }
        )
    }
    
    /// Turn any Collection into a Dictionary by transforming each element into both an optional key and an optional value. If either the key or the value is nil, nothing is added to the result and the element is skipped
    func asyncMakeCompactDictionary
        <Key: Hashable, Value>
        (key keyMap: (Element) async throws -> Key?,
         value valueMap: (Element) async throws -> Value?)
    async rethrows -> [Key: Value] {
        
        ///
        try await self.asyncReduce(into: .init(minimumCapacity: self.count)) { dictionary, element in

            ///
            guard let key = try await keyMap(element) else { return }

            ///
            dictionary[key] = try await valueMap(element)
        }
    }
    
    /// Turn any Collection into a Dictionary by transforming each element into both an optional key and an optional value. If either the key or the value is nil, nothing is added to the result and the element is skipped
    func concurrentMakeCompactDictionary
        <Key: Hashable, Value>
    (key keyMap: @escaping (Element) async throws -> Key?,
         value valueMap: @escaping (Element) async throws -> Value?)
    async rethrows -> [Key: Value] {
        
        ///
        return try await withThrowingTaskGroup(of: (key: Key, value: Value)?.self) { taskGroup in
            
            ///
            self.forEach { element in
                
                ///
                taskGroup.addTask {
                    
                    ///
                    guard let key = try await keyMap(element) else { return nil }
                    
                    ///
                    guard let value = try await valueMap(element) else { return nil }

                    ///
                    return (key, value)
                }
            }
            
            ///
            var dictionary: [Key: Value] = [:]
            
            ///
            for try await keyAndValue in taskGroup {
                
                ///
                guard let (key, value) = keyAndValue else { continue }
                
                ///
                dictionary[key] = value
            }
            
            ///
            return dictionary
        }
    }
}

///
public extension Collection where Element: Hashable {
    
    /// Creates a dictionary by iterating over all elements and mapping each one to a value, then storing that value in the new dictionary using the element as the key.
    ///
    /// - Parameter mapping: The transform function which takes in an element of the receiver and returns the corresponding value which should be stored in the new dictionary.
    func makeDictionary
        <Value>
        (_ valueMap: (Element)throws->Value)
    rethrows -> [Element: Value] {
        
        ///
        try makeDictionary(key: { $0 }, value: valueMap)
    }
    
    ///
    func makeCompactDictionary
        <Value>
        (_ valueMap: (Element)throws->Value?)
    rethrows -> [Element: Value] {
        
        ///
        try makeCompactDictionary(key: { $0 }, value: valueMap)
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
         value valueMap: (Element) throws -> Value)
    rethrows -> [Key: Value] {
        
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
         value valueMap: (Element) throws -> Value?)
    rethrows -> [Key: Value] {
        
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
