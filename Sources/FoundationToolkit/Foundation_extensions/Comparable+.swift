///
extension Comparable {
    
    ///
    public func clamped(
        to lowerBound: Self?,
        _ upperBound: Self?
    ) -> Self {
        
        ///
        guard self >= lowerBound ?? self else { return lowerBound ?? self }
        guard self <= upperBound ?? self else { return upperBound ?? self }
        return self
    }
    
    ///
    public func clamped(
        to limits: ClosedRange<Self>
    ) -> Self {
        
        ///
        self.clamped(
            to: limits.lowerBound,
            limits.upperBound
        )
    }
    
    ///
    public func clamped(to range: PartialRangeFrom<Self>) -> Self {
        self.clamped(to: range.lowerBound, nil)
    }
    
    ///
    public func clamped(to range: PartialRangeThrough<Self>) -> Self {
        self.clamped(to: nil, range.upperBound)
    }
    
    ///
    public mutating func clamp(
        to lowerBound: Self?,
        _ upperBound: Self?
    ) {
        
        ///
        self = self.clamped(to: lowerBound, upperBound)
    }
    
    ///
    public mutating func clamp(
        to limits: ClosedRange<Self>
    ) {
        
        ///
        self = self.clamped(to: limits)
    }
    
    ///
    public mutating func clamp(to range: PartialRangeFrom<Self>) {
        self.clamp(to: range.lowerBound, nil)
    }
    
    ///
    public mutating func clamp(to range: PartialRangeThrough<Self>) {
        self.clamp(to: nil, range.upperBound)
    }
}
