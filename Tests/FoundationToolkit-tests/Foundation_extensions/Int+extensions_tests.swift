extension Int_tests {
    
    ///
    func test_description_minimumDigitCount () throws {
        func test (_ int: Subject,
                   _ n: Int,
                   _ expected: String) throws {
            try int.description(minimumDigitCount: n)
                .assertEqual(to: expected)
        }
        try test(0, 0, "0")
        try test(0, 1, "0")
        try test(0, 2, "00")
        try test(0, 3, "000")
        try test(0, 20, "00000000000000000000")
        try test(199999999999999289, 18, "199999999999999289")
    }
}
