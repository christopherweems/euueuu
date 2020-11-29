//
//  OutputBuilder.swift
//  
//
//  Created by Christopher Weems on 11/29/20.
//

import Foundation

@_functionBuilder
public struct OutputBuilder {
    static var _function: OutputFunction = .print
    
    private static let ignoredLine = "#ignorethisline"
    
    private static func resetOutputFunction() {
        _function = .print
        
    }
    
}

public extension OutputBuilder {
    static func buildBlock(_ lines: String...) -> Void {
        lines.forEach {
            guard ignoredLine != $0 else { return }
            _function($0)
            
        }
        
        resetOutputFunction()
    }
    
}

public extension OutputBuilder {
    static func buildExpression(_ propertySetter: OutputFunction) -> String {
        _function = propertySetter
        return ignoredLine
    }
    
    static func buildExpression(_ value: String) -> String {
        value
    }
    
}
