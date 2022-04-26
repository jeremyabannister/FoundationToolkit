//
//  Task+extensions.swift
//  
//
//  Created by Jeremy Bannister on 4/7/22.
//

///
@available(iOS 13.0, macOS 10.15.0, *)
public extension Task where Failure == Never {
    
    ///
    func didComplete () async throws {
        _ = await self.result
    }
}

///
@available(iOS 13.0, macOS 10.15.0, *)
public extension Task {
    
    ///
    func didComplete () async throws {
        switch await self.result {
        case .success: return
        case .failure (let error): throw error
        }
    }
}

///
@available(iOS 13.0, macOS 10.15.0, *)
public extension Task
    where Success == Never,
          Failure == Never {
    
    ///
    static func sleep (seconds: Double) async throws {
        try await Task.sleep(nanoseconds: UInt64(seconds.times(.numberOfNanosecondsInSecond)))
    }
}

///
fileprivate extension Double {
    
    ///
    static var numberOfNanosecondsInSecond: Self {
        1_000_000_000
    }
}
