//
//  OverlayModifier.swift
//  
//
//  Created by Alik Moldovanu on 15.01.2023.
//

import SwiftUI

fileprivate struct OverlayModifier<Overlay: View>: ViewModifier {
    private let alignment: Alignment
    private let overlay: () -> Overlay
    
    init(alignment: Alignment, overlay: @escaping () -> Overlay) {
        self.alignment = alignment
        self.overlay = overlay
    }
    
    func body(content: Content) -> some View {
        if #available(iOS 15.0, *) {
            content
                .overlay(alignment: alignment, content: overlay)
        } else {
            content
                .overlay(overlay(), alignment: alignment)
        }
    }
}

public extension View {
    
    /// Custom Overlay Modifier
    func overlay<Overlay: View>(
        alignment: Alignment = .center,
        view: @escaping () -> Overlay
    ) -> some View {
        modifier(OverlayModifier(alignment: alignment, overlay: view))
    }
}
