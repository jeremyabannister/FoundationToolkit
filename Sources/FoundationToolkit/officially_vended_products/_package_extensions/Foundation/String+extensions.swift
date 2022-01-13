//
//  String+extensions.swift
//  
//
//  Created by Jeremy Bannister on 1/9/22.
//

///
public extension String {
    
    /// Encodes this `String` to `Data` using UTF8.
    ///
    /// This is a shortcut for the slightly more verbose:
    /// ```
    /// self.data(using: .utf8)!
    /// ```
    /// the permanent safety of which I first read about in this article:
    /// https://www.objc.io/blog/2018/02/13/string-to-data-and-back/
    /// and subsequently deemed to be sound and unexpiring advice, given the explicit fact that UTF8 is the permanently (ABI-related) preferred encoding for `Swift.String`, as stated in this article on swift.org:
    /// https://www.swift.org/blog/utf8-string/
    var utf8Data: Data {
        self.data(using: .utf8)!
    }
}
