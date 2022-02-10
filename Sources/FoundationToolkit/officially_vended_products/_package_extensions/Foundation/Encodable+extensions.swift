//
//  Encodable+extensions.swift
//  
//
//  Created by Jeremy Bannister on 1/24/22.
//

///
public extension Encodable {
    
    ///
    func asJSONString () throws -> String? {
        try self.asJSONData().utf8String
    }
    
    ///
    func asJSONData () throws -> Data {
        try JSONEncoder().encode(self)
    }
}
