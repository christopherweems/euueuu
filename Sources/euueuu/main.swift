import AppKit
import ArgumentParser
import Foundation
import unstandard

struct UUIDGenerator: OutputResultParsableCommand {
    @Flag(name: .shortAndLong, help: "Copy result to pasteboard")
    var copyToPasteboard = false
    
    @Option(name: [.long, .customShort("f")], help: "Wrap output with a format")
    var outputFormat = FormattedOutput.defaultReplacementSpecifier
    
    mutating func run() throws {
        let outputFormatter = FormattedOutput(format: outputFormat)
        
        /* Collect/generate program's output */
        
        UUID().formatted()
            .wrap { outputFormatter($0) }
        
        
        /*  Fill Pasteboard with output from above */
        
        if copyToPasteboard {
            ResultHandler { lines in
                let lines = lines
                    .map { $0.replacingOccurrences(of: .tab) }
                    .flatMap { $0.components(separatedBy: DelimiterReplacement.newline.delimiter) }
                    .joined(separator: "\n")
                
                Pasteboard.general {
                    $0.clearContents()
                    $0.setString(lines)
                    
                }
                
            }
            
        }
        
    }
    
    func validate() throws {
        try FormattedOutput(validate: outputFormat)
        
    }
    
}

UUIDGenerator.main()
