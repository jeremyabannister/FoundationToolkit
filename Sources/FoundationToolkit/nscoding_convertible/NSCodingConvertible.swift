//
//  NSCodingConvertible.swift
//  
//
//  Created by Jeremy Bannister on 8/12/22.
//

///
public protocol NSCodingConvertible: Codable {
    
    ///
    associatedtype NSCodingType: NSObject & NSCoding
    
    ///
    var asNSCodingType: NSCodingType { get }
    
    ///
    init (_ nscodingType: NSCodingType)
}

///
extension NSCodingConvertible {
    
    ///
    public func encode(
        to encoder: Encoder
    ) throws {
        
        ///
        var container = encoder.singleValueContainer()
        let data: Data
        if #available(macOS 10.13, iOS 11.0, *) {
            data = try NSKeyedArchiver.archivedData(withRootObject: self.asNSCodingType, requiringSecureCoding: false)
        } else {
            data = NSKeyedArchiver.archivedData(withRootObject: self.asNSCodingType)
        }
        try container.encode(data)
    }
    
    ///
    public init(
        from decoder: Decoder
    ) throws {
        
        ///
        let container = try decoder.singleValueContainer()
        let data = try container.decode(Data.self)
        if #available(macOS 10.13, iOS 11.0, *) {
            guard let value = try NSKeyedUnarchiver.unarchivedObject(ofClass: NSCodingType.self, from: data) else {
                throw "Failed to decode data as \(Self.self): \(data.humanReadableDescription)".asErrorMessage()
            }
            self.init(value)
        } else {
            guard let value = NSKeyedUnarchiver.unarchiveObject(with: data) as? NSCodingType else {
                throw "Failed to decode data as \(Self.self): \(data.humanReadableDescription)".asErrorMessage()
            }
            self.init(value)
        }
    }
}
