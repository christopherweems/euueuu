//
//  UUID+Extensions.swift
//  
//
//  Created by Christopher Weems on 11/29/20.
//

import Foundation
import unstandard

extension UUID {
    @ArrayBuilder var components: [UInt8] {
        uuid.0; uuid.1; uuid.2; uuid.3;
        uuid.4; uuid.5; uuid.6; uuid.7;
        uuid.8; uuid.9; uuid.10; uuid.11;
        uuid.12; uuid.13; uuid.14; uuid.15;
    }
    
}


extension UUID {
    enum Format {
        case jazz
        
    }
    
    @SingleResult func formatted(_ format: UUID.Format = .jazz) -> String {
        switch format {
        case .jazz:
            components
                .map(String.init)
                .joined(separator: ", ")
                .wrap { "(\($0))" }
            
        }
    }
    
}
