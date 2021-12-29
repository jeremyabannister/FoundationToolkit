//
//  MainThread.swift
//  
//
//  Created by Jeremy Bannister on 12/29/21.
//

///
public func MainThread (execute closure: @escaping ()->()) {
    DispatchQueue.main.async(execute: closure)
}
