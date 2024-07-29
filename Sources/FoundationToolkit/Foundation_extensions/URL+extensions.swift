//
//  URL+extensions.swift
//  
//
//  Created by Jeremy Bannister on 5/22/23.
//

///
extension URL {
    
    ///
    public static func documentsDirectory(
        subPath: [String] = []
    ) -> Self {
        
        ///
        FileManager
            .default
            .urls(
                for: .documentDirectory,
                in: .userDomainMask
            )
            .first!
            .transform { documentsDirectoryURL in
                subPath.reduce(into: documentsDirectoryURL) {
                    if #available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *) {
                        $0.append(path: $1)
                    } else {
                        $0.appendPathComponent($1)
                    }
                }
            }
    }
}
