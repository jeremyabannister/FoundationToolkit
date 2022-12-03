//
//  Data+extensions.swift
//  
//
//  Created by Jeremy Bannister on 1/9/22.
//

///
public extension Data {
    
    ///
    func jsonDecoded <T: Decodable> (as type: T.Type = T.self) throws -> T {
        do {
            return try JSONDecoder().decode(type, from: self)
        } catch {
            throw "DecodingError: \(error), Data: \(self.humanReadableDescription)".asErrorMessage()
        }
    }
}
