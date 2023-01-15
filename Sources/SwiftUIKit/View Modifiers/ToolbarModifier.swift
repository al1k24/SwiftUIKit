//
//  ToolbarModifier.swift
//  
//
//  Created by Alik Moldovanu on 15.01.2023.
//

import SwiftUI

public enum CustomToolbarItemPlacement {
    case leading
    case trailing
}

fileprivate struct ToolbarModifier<ToolbarContent: View>: ViewModifier {
    private let itemPlacement: CustomToolbarItemPlacement
    @ViewBuilder private let toolbarContent: () -> ToolbarContent
    
    init(
        _ placement: CustomToolbarItemPlacement,
        content: @escaping () -> ToolbarContent
    ) {
        self.toolbarContent = content
        self.itemPlacement = placement
    }
    
    @available(iOS 14.0, *)
    private var placement: ToolbarItemPlacement {
        switch itemPlacement {
        case .leading:
            return .navigationBarLeading
        case .trailing:
            return .navigationBarTrailing
        }
    }
    
    @available(iOS, introduced: 13.0, deprecated: 14.0)
    private var oldToolbarContent: some View {
        HStack(content: toolbarContent)
    }
    
    func body(content: Content) -> some View {
        if #available(iOS 14.0, *) {
            content
                .toolbar {
                    ToolbarItem(placement: placement, content: toolbarContent)
                }
        } else {
            switch itemPlacement {
            case .leading:
                content
                    .navigationBarItems(leading: oldToolbarContent)
            case .trailing:
                content
                    .navigationBarItems(trailing: oldToolbarContent)
            }
        }
    }
}

public extension View {
    
    func toolbar<Content: View>(
        _ placement: CustomToolbarItemPlacement,
        content: @escaping () -> Content
    ) -> some View {
        modifier(ToolbarModifier(placement, content: content))
    }
}
