import AppKit
import ArgumentParser
import Foundation
import unstandard

struct UUIDGenerator: OutputResultParsableCommand {
    @Flag(name: .shortAndLong, help: "Copy result to pasteboard")
    var copyToPasteboard = false
    
    @Option(name: [.long, .customShort("f")], help: "Wrap output with a format")
    var outputFormat = FormattedOutput.defaultReplacementSpecifier
    
    @Flag(name: .shortAndLong, help: "Repeat UUID generation (Press CTRL+D to quit)")
    var `repeat` = false
    
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
        
        if `repeat` {
            let nextExecution = self
            
            ResultHandler { _ in
                guard let _ = readLine() else { return }
                var nextExecution = nextExecution
                try! nextExecution.run()
                
            }
            
        }
        
    }
    
    func validate() throws {
        try FormattedOutput(validate: outputFormat)
        
    }
    
}

UUIDGenerator.main()
