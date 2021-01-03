//
//  OutputFunction.swift
//  
//
//  Created by Christopher Weems on 11/29/20.
//

import Foundation

public struct OutputFunction: BodiedFunction {
    public typealias Function = (String) -> Void
    public let body: Function
    
    public init(_ body: @escaping (String) -> Void) {
        self.body = body
        
    }
    
}

extension OutputFunction {
    static var print: Self {
        Self {
            $0.replacingOccurrences(of: .tab)
                .components(separatedBy: DelimiterReplacement.newline.delimiter)
                .forEach { Swift.print($0) }
            
        }
    }
    
}

func setOutput<Self>(_ output: Self) -> Self {
    output
}
