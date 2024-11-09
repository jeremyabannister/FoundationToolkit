//
//  Task+extensions.swift
//  
//
//  Created by Jeremy Bannister on 4/7/22.
//

///
@available(iOS 13.0, macOS 10.15.0, watchOS 6.0.0, tvOS 13.0.0, *)
extension Task where Failure == Error {
    
    ///
    @discardableResult
    public static func mainActor(
        _ closure: @escaping @MainActor ()async throws->Success
    ) -> Self {
        
        ///
        Task { @MainActor in
            try await closure()
        }
    }
}

///
@available(iOS 13.0, macOS 10.15.0, watchOS 6.0.0, tvOS 13.0.0, *)
extension Task where Failure == Never {
    
    ///
    public func didComplete() async throws {
        _ = await self.result
    }
}

///
@available(iOS 13.0, macOS 10.15.0, watchOS 6.0.0, tvOS 13.0.0, *)
extension Task {
    
    ///
    public func didComplete() async throws {
        switch await self.result {
        case .success: return
        case .failure(let error): throw error
        }
    }
}

///
@available(iOS 13.0, macOS 10.15.0, watchOS 6.0.0, tvOS 13.0.0, *)
extension Task where Failure == Error {
    
    ///
    @discardableResult
    public static func launchAfterSeconds(
        _ delayInSeconds: TimeInterval,
        closure: sending @escaping ()async throws->Success
    ) -> Task<Success, Error> {
        
        ///
        Task<Success, Error> {
            
            ///
            try await Task<Never, Never>
                .sleep(
                    seconds: delayInSeconds
                )
            
            ///
            return try await closure()
        }
    }
}

///
@available(iOS 13.0, macOS 10.15.0, watchOS 6.0.0, tvOS 13.0.0, *)
extension Task
    where Success == Never,
          Failure == Never {
    
    ///
    public static func sleep(
        seconds: Double
    ) async throws {
        
        ///
        try await Task.sleep(nanoseconds: UInt64(seconds.times(.numberOfNanosecondsInSecond)))
    }
}

///
private extension Double {
    
    ///
    static var numberOfNanosecondsInSecond: Self {
        1_000_000_000
    }
}
