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
    static var _resultHandlers: [ResultHandler] = []
    
    private static let ignoredLine = "#ignorethisline"
    
    private static func resetOutputFunction() {
        _function = .print
        _resultHandlers = []
        
    }
    
}

public extension OutputBuilder {
    static func buildBlock(_ lines: String...) -> Void {
        let lines = lines.filter { $0 != ignoredLine }
        
        lines.forEach {
            _function($0)
            
        }
        
        if !lines.isEmpty {
            _resultHandlers.forEach { $0(lines) }
            resetOutputFunction()
            
        }
        
    }
    
    static func buildOptional(_ nothing: Void?) -> String {
        return ignoredLine
    }
    
}

public extension OutputBuilder {
    static func buildExpression(_ outputFunction: OutputFunction) -> String {
        _function = outputFunction
        return ignoredLine
    }
    
    static func buildExpression(_ resultHandler: ResultHandler) -> String {
        _resultHandlers.append(resultHandler)
        return ignoredLine
    }
    
    static func buildExpression(_ value: String) -> String {
        return value
    }
    
}
