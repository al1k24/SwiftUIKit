//
//  BackgroundModifier.swift
//  
//
//  Created by Alik Moldovanu on 15.01.2023.
//

import SwiftUI

fileprivate struct BackgroundModifier<Background: View>: ViewModifier {
    private let alignment: Alignment
    private let background: () -> Background
    
    init(alignment: Alignment, background: @escaping () -> Background) {
        self.alignment = alignment
        self.background = background
    }
    
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .background(alignment: alignment, content: background)
        } else {
            content
                .background(background(), alignment: alignment)
        }
    }
}

public extension View {
    
    /// Custom Background Modifier
    func background<Background: View>(
        alignment: Alignment = .center,
        view: @escaping () -> Background
    ) -> some View {
        modifier(BackgroundModifier(alignment: alignment, background: view))
    }
}
