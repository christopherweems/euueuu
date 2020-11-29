//
//  Pasteboard.swift
//  
//
//  Created by Christopher Weems on 11/29/20.
//

import Foundation

#if canImport(AppKit)
import AppKit

#endif


internal class Pasteboard {
    #if canImport(AppKit)
    let nsPasteboard = NSPasteboard.general
    
    #endif
    
    func setString(_ pasteboardContents: String) {
        #if canImport(AppKit)
        nsPasteboard.setString(pasteboardContents, forType: .string)
        
        #else
        assertionFailure("Pasteboard not implemented for this platform")
        
        #endif
    }
    
    func clearContents() {
        #if canImport(AppKit)
        nsPasteboard.clearContents()
        #endif
    }
    
}
