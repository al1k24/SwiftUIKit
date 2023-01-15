//
//  View+.swift
//  
//
//  Created by Alik Moldovanu on 15.01.2023.
//

import SwiftUI

public extension View {
    func getRect() -> CGRect {
        return UIScreen.main.bounds
    }
    
    func getSafeArea() -> UIEdgeInsets {
        return UIApplication.shared.safeArea
    }
}
