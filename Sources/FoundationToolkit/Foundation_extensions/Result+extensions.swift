//
//  Result+extensions.swift
//  
//
//  Created by Jeremy Bannister on 4/29/22.
//

///
extension Result {
    
    ///
    public var successfulValue: Success? {
        try? getSuccessfulValue()
    }
    
    ///
    public func getSuccessfulValue() throws -> Success {
        switch self {
        case .success(let value): return value
        case .failure(let error): throw error
        }
    }
    
    ///
    public var error: (any Error)? {
        switch self {
        case .success: return nil
        case .failure(let error):
            return error
        }
    }
}

///
extension Result: Codable
    where Success: Codable,
          Failure: Codable {
    
    ///
    public func encode(
        to encoder: Encoder
    ) throws {
        
        ///
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        ///
        switch self {
            
        ///
        case .success(let successfulValue):
            
            ///
            try container.encode(successfulValue, forKey: .success)
            
        ///
        case .failure(let error):
            
            ///
            try container.encode(error, forKey: .failure)
        }
    }
    
    ///
    public init(
        from decoder: Decoder
    ) throws {
        
        ///
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        ///
        do {
            
            ///
            let success = try container.decode(Success.self, forKey: .success)
            
            ///
            self = .success(success)
            
        ///
        } catch {
            
            ///
            if let failure = try? container.decode(Failure.self, forKey: .failure) {
                
                ///
                self = .failure(failure)
                
            ///
            } else {
                
                ///
                throw error
            }
        }
    }
    
    ///
    private enum CodingKeys: CodingKey {
        case success
        case failure
    }
}

///
extension Result {
    
    ///
    public func map<
        NewSuccess
    >(
        _ transform: (Success)throws->NewSuccess
    ) throws -> Result<NewSuccess, Failure> {
        
        ///
        switch self {
            
        ///
        case .success(let successfulValue):
            
            ///
            return try .success(transform(successfulValue))
            
        ///
        case .failure(let error):
            
            ///
            return .failure(error)
        }
    }
}
