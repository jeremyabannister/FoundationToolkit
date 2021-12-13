//
//  XCTestCase+conformanceProofs_tests.swift
//  
//
//  Created by Jeremy Bannister on 12/8/21.
//

///
@available(iOS 13, macOS 10.15, watchOS 6, tvOS 13, *)
extension XCTestCase_tests {
    
    ///
    func test_proof_Identifiable_metatype () {
        func imagine <T: Identifiable> (t: T) {
            ifGiven(metatype) {
                $0.proof_Identifiable(T.self)
            }
        }
    }
    
    ///
    func test_proof_Identifiable_instance () {
        func imagine <T: Identifiable> (t: T) {
            ifGiven(metatype) {
                $0.proof_Identifiable(t)
            }
        }
    }
}

///
extension XCTestCase_tests {
    
    ///
    func test_proof_AdditiveArithmetic_metatype () {
        func imagine <T: AdditiveArithmetic> (t: T) {
            ifGiven(metatype) {
                $0.proof_AdditiveArithmetic(T.self)
            }
        }
    }
    
    ///
    func test_proof_AdditiveArithmetic_instance () {
        func imagine <T: AdditiveArithmetic> (t: T) {
            ifGiven(metatype) {
                $0.proof_AdditiveArithmetic(t)
            }
        }
    }
    
    ///
    func test_proof_AnyObject_metatype () {
        func imagine <T: AnyObject> (t: T) {
            ifGiven(metatype) {
                $0.proof_AnyObject(T.self)
            }
        }
    }
    
    ///
    func test_proof_AnyObject_instance () {
        func imagine <T: AnyObject> (t: T) {
            ifGiven(metatype) {
                $0.proof_AnyObject(t)
            }
        }
    }
    
    ///
    func test_proof_CaseIterable_metatype () {
        func imagine <T: CaseIterable> (t: T) {
            ifGiven(metatype) {
                $0.proof_CaseIterable(T.self)
            }
        }
    }
    
    ///
    func test_proof_CaseIterable_instance () {
        func imagine <T: CaseIterable> (t: T) {
            ifGiven(metatype) {
                $0.proof_CaseIterable(t)
            }
        }
    }
    
    ///
    func test_proof_Codable_metatype () {
        func imagine <T: Codable> (t: T) {
            ifGiven(metatype) {
                $0.proof_Codable(T.self)
            }
        }
    }
    
    ///
    func test_proof_Codable_instance () {
        func imagine <T: Codable> (t: T) {
            ifGiven(metatype) {
                $0.proof_Codable(t)
            }
        }
    }
    
    ///
    func test_proof_CodingKey_metatype () {
        func imagine <T: CodingKey> (t: T) {
            ifGiven(metatype) {
                $0.proof_CodingKey(T.self)
            }
        }
    }
    
    ///
    func test_proof_CodingKey_instance () {
        func imagine <T: CodingKey> (t: T) {
            ifGiven(metatype) {
                $0.proof_CodingKey(t)
            }
        }
    }
    
    ///
    func test_proof_Comparable_metatype () {
        func imagine <T: Comparable> (t: T) {
            ifGiven(metatype) {
                $0.proof_Comparable(T.self)
            }
        }
    }
    
    ///
    func test_proof_Comparable_instance () {
        func imagine <T: Comparable> (t: T) {
            ifGiven(metatype) {
                $0.proof_Comparable(t)
            }
        }
    }
    
    ///
    func test_proof_CustomStringConvertible_metatype () {
        func imagine <T: CustomStringConvertible> (t: T) {
            ifGiven(metatype) {
                $0.proof_CustomStringConvertible(T.self)
            }
        }
    }
    
    ///
    func test_proof_CustomStringConvertible_instance () {
        func imagine <T: CustomStringConvertible> (t: T) {
            ifGiven(metatype) {
                $0.proof_CustomStringConvertible(t)
            }
        }
    }
    
    ///
    func test_proof_Error_metatype () {
        func imagine <T: Error> (t: T) {
            ifGiven(metatype) {
                $0.proof_Error(T.self)
            }
        }
    }
    
    ///
    func test_proof_Error_instance () {
        func imagine <T: Error> (t: T) {
            ifGiven(metatype) {
                $0.proof_Error(t)
            }
        }
    }
    
    ///
    func test_proof_Equatable_metatype () {
        func imagine <T: Equatable> (t: T) {
            ifGiven(metatype) {
                $0.proof_Equatable(T.self)
            }
        }
    }
    
    ///
    func test_proof_Equatable_instance () {
        func imagine <T: Equatable> (t: T) {
            ifGiven(metatype) {
                $0.proof_Equatable(t)
            }
        }
    }
    
    ///
    func test_proof_ExpressibleByFloatLiteral_metatype () {
        func imagine <T: ExpressibleByFloatLiteral> (t: T) {
            ifGiven(metatype) {
                $0.proof_ExpressibleByFloatLiteral(T.self)
            }
        }
    }
    
    ///
    func test_proof_ExpressibleByFloatLiteral_instance () {
        func imagine <T: ExpressibleByFloatLiteral> (t: T) {
            ifGiven(metatype) {
                $0.proof_ExpressibleByFloatLiteral(t)
            }
        }
    }
    
    ///
    func test_proof_ExpressibleByIntegerLiteral_metatype () {
        func imagine <T: ExpressibleByIntegerLiteral> (t: T) {
            ifGiven(metatype) {
                $0.proof_ExpressibleByIntegerLiteral(T.self)
            }
        }
    }
    
    ///
    func test_proof_ExpressibleByIntegerLiteral_instance () {
        func imagine <T: ExpressibleByIntegerLiteral> (t: T) {
            ifGiven(metatype) {
                $0.proof_ExpressibleByIntegerLiteral(t)
            }
        }
    }
    
    ///
    func test_proof_Hashable_metatype () {
        func imagine <T: Hashable> (t: T) {
            ifGiven(metatype) {
                $0.proof_Hashable(T.self)
            }
        }
    }
    
    ///
    func test_proof_Hashable_instance () {
        func imagine <T: Hashable> (t: T) {
            ifGiven(metatype) {
                $0.proof_Hashable(t)
            }
        }
    }
    
    ///
    func test_proof_Numeric_metatype () {
        func imagine <T: Numeric> (t: T) {
            ifGiven(metatype) {
                $0.proof_Numeric(T.self)
            }
        }
    }
    
    ///
    func test_proof_Numeric_instance () {
        func imagine <T: Numeric> (t: T) {
            ifGiven(metatype) {
                $0.proof_Numeric(t)
            }
        }
    }
    
    ///
    func test_proof_RawRepresentable_metatype () {
        func imagine <T: RawRepresentable> (t: T) {
            ifGiven(metatype) {
                $0.proof_RawRepresentable(T.self)
            }
        }
    }
    
    ///
    func test_proof_RawRepresentable_instance () {
        func imagine <T: RawRepresentable> (t: T) {
            ifGiven(metatype) {
                $0.proof_RawRepresentable(t)
            }
        }
    }
    
    ///
    func test_proof_SignedNumeric_metatype () {
        func imagine <T: SignedNumeric> (t: T) {
            ifGiven(metatype) {
                $0.proof_SignedNumeric(T.self)
            }
        }
    }
    
    ///
    func test_proof_SignedNumeric_instance () {
        func imagine <T: SignedNumeric> (t: T) {
            ifGiven(metatype) {
                $0.proof_SignedNumeric(t)
            }
        }
    }
}
