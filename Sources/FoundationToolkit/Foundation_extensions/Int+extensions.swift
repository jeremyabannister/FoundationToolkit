//
//  Int+extensions.swift
//  
//
//  Created by Jeremy Bannister on 9/23/22.
//

///
extension Int {
    
    ///
    public func description(
        minimumDigitCount: Int
    ) -> String {
        
        ///
        Array(
            repeating: "0",
            count:
                minimumDigitCount
                    .minus(self.description.count)
                    .clamped(to: 0, nil)
        )
            .joined()
            .plus(self.description)
    }
}

///
extension Int {
    
    ///
    public var seconds: TimeInterval {
        Double(self)
    }
}
