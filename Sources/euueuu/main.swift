import AppKit
import ArgumentParser
import Foundation
import unstandard

struct UUIDGenerator: OutputResultParsableCommand {
    @Flag(name: .shortAndLong, help: "Copy result to pasteboard")
    var copyToPasteboard = false
    
    mutating func run() throws {
        let copyToPasteboard = self.copyToPasteboard
        
        UUID().formatted()
        
        ResultHandler { lines in
            let pasteboard = Pasteboard()
            assert(lines.count == 1)
            
            if copyToPasteboard, let line = lines.first {
                pasteboard.clearContents()
                pasteboard.setString(line)
                
            }
            
        }
    }
    
}

UUIDGenerator.main()
