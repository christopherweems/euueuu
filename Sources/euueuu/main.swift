import AppKit
import ArgumentParser
import Foundation
import unstandard

struct UUIDGenerator: OutputResultParsableCommand {
    @Flag(name: .shortAndLong, help: "Copy result to pasteboard")
    var copyToPasteboard = false
    
    mutating func run() throws {
        
        /* Collect/generate program's output */
        
        UUID().formatted()
        
        
        /*  Fill Pasteboard with output from above */
        
        if copyToPasteboard {
            ResultHandler { lines in
                let lines = lines.joined(separator: "\n")
                
                Pasteboard.general {
                    $0.clearContents()
                    $0.setString(lines)
                    
                }
            }
            
        }
        
    }
    
}

UUIDGenerator.main()
