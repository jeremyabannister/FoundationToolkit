import FoundationTestToolkit

///
extension AdditiveArithmetic_tests {
    
    ///
    func test_isPositive_whereSelfComparable () throws {
        func test <T> (_ int: T,
                       _ expected: Bool) throws
            where T: AdditiveArithmetic,
                  T: Comparable,
                  T: Testable {
            
            try int.isPositive
                .assertEqual(to: expected)
        }
        try test(0, false)
        try test(1, true)
        try test(2, true)
        try test(100, true)
        try test(-1, false)
        try test(-2, false)
        try test(0.0000001, true)
        try test(-0.0000001, false)
    }
    
    ///
    func test_isNegative_whereSelfComparable () throws {
        func test <T> (_ int: T,
                       _ expected: Bool) throws
            where T: AdditiveArithmetic,
                  T: Comparable,
                  T: Testable {
            
            try int.isNegative
                .assertEqual(to: expected)
        }
        try test(0, false)
        try test(1, false)
        try test(2, false)
        try test(100, false)
        try test(-1, true)
        try test(-2, true)
        try test(0.0000001, false)
        try test(-0.0000001, true)
    }
}
