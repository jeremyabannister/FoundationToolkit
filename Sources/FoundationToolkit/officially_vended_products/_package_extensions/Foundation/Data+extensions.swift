//
//  Data+extensions.swift
//  
//
//  Created by Jeremy Bannister on 1/9/22.
//

///
public extension Data {
    
    /// Attempts to decode the `Data` as a `String` using `String.Encoding.utf8`.
    ///
    /// This is just a handy shortcut for the slightly more verbose implementation:
    /// ```
    /// String(data: self, encoding: .utf8)
    /// ```
    var utf8String: String? {
        String(data: self, encoding: .utf8)
    }
}