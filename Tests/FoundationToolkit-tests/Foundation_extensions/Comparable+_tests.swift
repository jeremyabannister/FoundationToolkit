import Testing

struct Comparable_tests {
    // TODO: @Test func clamped_to_lowerBound_upperBound
    // TODO: @Test func clamped_to_ClosedRange
    
    @Test func clamped_to_PartialRangeFrom() {
        #expect(1.clamped(to: 0...) == 1)
        #expect(1.clamped(to: 1...) == 1)
        #expect(1.clamped(to: 2...) == 2)
    }
    
    @Test func clamped_to_PartialRangeThrough() {
        #expect(1.clamped(to: ...0) == 0)
        #expect(1.clamped(to: ...1) == 1)
        #expect(1.clamped(to: ...2) == 1)
    }
    
    // TODO: @Test func clamp_to_lowerBound_upperBound
    // TODO: @Test func clamped_to_ClosedRange
    
    @Test func clamp_to_PartialRangeFrom() {
        func test(_ lowerBound: Int, _ expected: Int) {
            var value = 1
            value.clamp(to: lowerBound...)
            #expect(value == expected)
        }
        test(0, 1)
        test(1, 1)
        test(2, 2)
    }
    
    @Test func clamp_to_PartialRangeThrough() {
        func test(_ upperBound: Int, _ expected: Int) {
            var value = 1
            value.clamp(to: ...upperBound)
            #expect(value == expected)
        }
        test(0, 0)
        test(1, 1)
        test(2, 1)
    }
}
