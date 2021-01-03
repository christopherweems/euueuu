//
//  DelimiterReplacement.swift
//  
//
//  Created by Christopher Weems on 1/3/21.
//

import Foundation

struct DelimiterReplacement {
    static let tab = DelimiterReplacement(delimiter: "\\t", replacement: "    ")
    static let newline = DelimiterReplacement(delimiter: "\\n", replacement: "\\n")
    
    let delimiter: String
    let replacement: String
    
}

extension String {
    func replacingOccurrences(of delimiter: DelimiterReplacement) -> String {
        self.replacingOccurrences(of: delimiter.delimiter, with: delimiter.replacement)
    }
    
}
