//
//  URLRequest+extensions.swift
//  
//
//  Created by Jeremy Bannister on 1/16/22.
//

///
@available(iOS 13.0, macOS 10.15.0, watchOS 6.0.0, tvOS 13.0.0, *)
extension URLRequest {
    
    ///
    public func fetchData() async throws -> Data {
        try await self.execute().data
    }
    
    ///
    public func execute() async throws -> (data: Data, response: URLResponse) {
        
        ///
        try await withCheckedThrowingContinuation { continuation in
            URLSession
                .shared
                .dataTask(
                    with: self,
                    completionHandler: { data, urlResponse, error in
                        
                        ///
                        if let data = data,
                           let urlResponse = urlResponse {
                            
                            ///
                            continuation.resume(returning: (data, urlResponse))
                            
                        ///
                        } else if let error = error {
                            continuation.resume(throwing: error)
                        
                        ///
                        } else {
                            continuation.resume(throwing: "URLRequest.execute() - No data was returned but neither was any error.".asErrorMessage())
                        }
                    }
                )
                .resume()
        }
    }
}
