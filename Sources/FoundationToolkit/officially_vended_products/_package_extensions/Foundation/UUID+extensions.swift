//
//  UUID+extensions.swift
//
//
//  Created by Jeremy Bannister on 1/24/22.
//

///
public extension UUID {
    
    ///
    @available(*, deprecated, message: "This method has been renamed to .generateRandom(), because that is actually what it does, and the word generate by itself is too broad.")
    static func generate () -> Self {
        .generateRandom()
    }
}
