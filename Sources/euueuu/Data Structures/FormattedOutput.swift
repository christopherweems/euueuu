//
//  FormattedOutput.swift
//  
//
//  Created by Christopher Weems on 1/3/21.
//

import Foundation
import unstandard

struct FormattedOutput {
    static let defaultReplacementSpecifier = "%s"
    
    let format: String
    var replacementSpecifier = Self.defaultReplacementSpecifier
    
    func format(_ replacement: String) -> String {
        format.replacingOccurrences(of: replacementSpecifier, with: replacement)
    }
    
    func callAsFunction(_ replacement: String) -> String {
        self.format(replacement)
    }
    
}

extension FormattedOutput {
    enum ValidationError: Error {
        case formatStringMissingReplacementSpecifier
        
    }
    
    func validate() throws {
        if !format.contains(replacementSpecifier) {
            throw ValidationError.formatStringMissingReplacementSpecifier
            
        }
        
    }
    
    @discardableResult init?(validate formatString: String) throws {
        let unvalidated = Self.init(format: formatString)
        try unvalidated.validate()
        return nil
    }
    
}
