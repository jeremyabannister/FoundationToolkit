//
//  URLQueryItem+extensions.swift
//  
//
//  Created by Jeremy Bannister on 8/12/22.
//

///
extension URLQueryItem: NSCodingConvertible {
    
    ///
    public var asNSCodingType: NSURLQueryItem {
        self as NSURLQueryItem
    }
    
    ///
    public init (_ nscodingType: NSURLQueryItem) {
        self = nscodingType as Self
    }
}
