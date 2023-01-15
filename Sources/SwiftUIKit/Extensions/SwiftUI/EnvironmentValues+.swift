//
//  EnvironmentValues+.swift
//  
//
//  Created by Alik Moldovanu on 15.01.2023.
//

import SwiftUI

public extension EnvironmentValues {
    var dismissView: () -> Void {
        if #available(iOS 15.0, *) {
            return dismiss.callAsFunction
        } else {
            return {
                presentationMode.wrappedValue.dismiss()
            }
        }
    }
}
