import ArgumentParser
import Foundation
import unstandard

struct UUIDGenerator: OutputResultParsableCommand {
    mutating func run() throws {
        UUID().formatted()
        
    }
    
}

UUIDGenerator.main()
