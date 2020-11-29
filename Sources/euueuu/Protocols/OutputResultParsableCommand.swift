//
//  OutputResultParsableCommand.swift
//  
//
//  Created by Christopher Weems on 11/29/20.
//

import Foundation
import ArgumentParser

protocol OutputResultParsableCommand: ParsableCommand {
    @OutputBuilder mutating func run() throws
    
}
