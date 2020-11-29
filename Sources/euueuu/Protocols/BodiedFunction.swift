//
//  BodiedFunction.swift
//  
//
//  Created by Christopher Weems on 11/29/20.
//

import Foundation

public protocol BodiedFunction {
    associatedtype Arguments
    associatedtype Result
    
    typealias Function = (Arguments) -> Result
    
    var body: Function { get }
    
    init(_ body: @escaping (Arguments) -> Result)
    
}

extension BodiedFunction {
    func callAsFunction(_ arguments: Arguments) -> Result {
        body(arguments)
    }
    
}
