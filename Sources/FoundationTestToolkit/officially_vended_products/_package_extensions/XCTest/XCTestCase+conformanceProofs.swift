//
//  XCTestCase+conformanceProofs.swift
//  
//
//  Created by Jeremy Bannister on 12/8/21.
//

///
@available(iOS 13, macOS 10.15, watchOS 6, tvOS 13, *)
public extension XCTestCase {
    
    ///
    func proof_Identifiable <T: Identifiable> (_ t: T.Type) { }
    
    ///
    func proof_Identifiable <T: Identifiable> (_ t: T) { }
}

///
public extension XCTestCase {
    
    ///
    func proof_AdditiveArithmetic <T: AdditiveArithmetic> (_ t: T.Type) { }
    
    ///
    func proof_AdditiveArithmetic <T: AdditiveArithmetic> (_ t: T) { }
    
    ///
    func proof_AnyObject <T: AnyObject> (_ t: T.Type) { }
    
    ///
    func proof_AnyObject <T: AnyObject> (_ t: T) { }
    
    ///
    func proof_CaseIterable <T: CaseIterable> (_ t: T.Type) { }
    
    ///
    func proof_CaseIterable <T: CaseIterable> (_ t: T) { }
    
    ///
    func proof_Codable <T: Codable> (_ t: T.Type) { }
    
    ///
    func proof_Codable <T: Codable> (_ t: T) { }
    
    ///
    func proof_CodingKey <T: CodingKey> (_ t: T.Type) { }
    
    ///
    func proof_CodingKey <T: CodingKey> (_ t: T) { }
    
    ///
    func proof_Comparable <T: Comparable> (_ t: T.Type) { }
    
    ///
    func proof_Comparable <T: Comparable> (_ t: T) { }
    
    ///
    func proof_CustomStringConvertible <T: CustomStringConvertible> (_ t: T.Type) { }
    
    ///
    func proof_CustomStringConvertible <T: CustomStringConvertible> (_ t: T) { }
    
    ///
    func proof_Error <T: Error> (_ t: T.Type) { }
    
    ///
    func proof_Error <T: Error> (_ t: T) { }
    
    ///
    func proof_Equatable <T: Equatable> (_ t: T.Type) { }
    
    ///
    func proof_Equatable <T: Equatable> (_ t: T) { }
    
    ///
    func proof_ExpressibleByFloatLiteral <T: ExpressibleByFloatLiteral> (_ t: T.Type) { }
    
    ///
    func proof_ExpressibleByFloatLiteral <T: ExpressibleByFloatLiteral> (_ t: T) { }
    
    ///
    func proof_ExpressibleByIntegerLiteral <T: ExpressibleByIntegerLiteral> (_ t: T.Type) { }
    
    ///
    func proof_ExpressibleByIntegerLiteral <T: ExpressibleByIntegerLiteral> (_ t: T) { }
    
    ///
    func proof_Hashable <T: Hashable> (_ t: T.Type) { }
    
    ///
    func proof_Hashable <T: Hashable> (_ t: T) { }
    
    ///
    func proof_Numeric <T: Numeric> (_ t: T.Type) { }
    
    ///
    func proof_Numeric <T: Numeric> (_ t: T) { }
    
    ///
    func proof_RawRepresentable <T: RawRepresentable> (_ t: T.Type) { }
    
    ///
    func proof_RawRepresentable <T: RawRepresentable> (_ t: T) { }
    
    ///
    func proof_SignedNumeric <T: SignedNumeric> (_ t: T.Type) { }
    
    ///
    func proof_SignedNumeric <T: SignedNumeric> (_ t: T) { }
}
