//
//  Button+Image.swift
//  
//
//  Created by Alik Moldovanu on 15.01.2023.
//

import SwiftUI

extension Button where Label == Image {
    init(systemName: String, action: @escaping () -> Void) {
        self.init(action: action, label: { Image(systemName: systemName) })
    }
}
