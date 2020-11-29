//
//  ResultHandler.swift
//  
//
//  Created by Christopher Weems on 11/29/20.
//

import Foundation

public struct ResultHandler: BodiedFunction {
    public typealias Arguments = [String]
    public typealias Result = Void
    
    public var body: Function
    
    public init(_ body: @escaping ([String]) -> Void) {
        self.body = body
    }
    
}

public extension ResultHandler {
    static var identity: Self {
        Self { _ in }
    }
    
}
