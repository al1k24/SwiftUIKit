//
//  String+Localizad.swift
//  
//
//  Created by Alik Moldovanu on 15.01.2023.
//

import Foundation

public extension String {
    var localized: String {
        let localized = NSLocalizedString(
            self,
            comment: ""
        )
        
        return localized.isEmpty ? self : localized
    }
    
    func localized(table: String) -> String {
        let localized = NSLocalizedString(
            self,
            tableName: table,
            comment: ""
        )
        
        return localized.isEmpty ? self : localized
    }
    
    func localized(arguments: CVarArg...) -> String {
        let localized = String(
            format: NSLocalizedString(
                self,
                comment: ""
            ),
            arguments: arguments
        )
        
        return localized.isEmpty ? self : localized
    }
    
    func localized(table: String, arguments: CVarArg...) -> String {
        let localized = String(
            format: NSLocalizedString(
                self,
                tableName: table,
                comment: ""
            ),
            arguments: arguments
        )
        
        return localized.isEmpty ? self : localized
    }
}
