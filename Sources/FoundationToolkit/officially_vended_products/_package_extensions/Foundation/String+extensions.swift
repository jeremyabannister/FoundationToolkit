//
//  String+extensions.swift
//  
//
//  Created by Jeremy Bannister on 1/9/22.
//

///
public extension String {
    
    /// Attempts to convert the `String` to `Data` using `String.Encoding.utf8`.
    ///
    /// This is just a handy shortcut for the slightly more verbose implementation:
    /// ```
    /// self.data(using: .utf8)
    /// ```
    var utf8Data: Data? {
        self.data(using: .utf8)
    }
}
