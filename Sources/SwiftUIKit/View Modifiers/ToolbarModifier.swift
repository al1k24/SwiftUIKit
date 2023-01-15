//
//  ToolbarModifier.swift
//  
//
//  Created by Alik Moldovanu on 15.01.2023.
//

import SwiftUI

public enum ToolbarItemPlacement {
    case leading
    case trailing
}

fileprivate struct ToolbarLeadingModifier<Item: View>: ViewModifier {
    @ViewBuilder var item: () -> Item
    
    func body(content: Content) -> some View {
        if #available(iOS 14.0, *) {
            content
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading, content: item)
                }
        } else {
            content
                .navigationBarItems(leading: HStack(content: item))
        }
    }
}

fileprivate struct ToolbarTrailingModifier<Item: View>: ViewModifier {
    @ViewBuilder var item: () -> Item
    
    func body(content: Content) -> some View {
        if #available(iOS 14.0, *) {
            content
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing, content: item)
                }
        } else {
            content
                .navigationBarItems(trailing: HStack(content: item))
        }
    }
}

public extension View {
    
    @ViewBuilder
    func toolbar<Content: View>(
        _ placement: ToolbarItemPlacement,
        content: @escaping () -> Content
    ) -> some View {
        switch placement {
        case .leading:
            modifier(ToolbarLeadingModifier(item: content))
        case .trailing:
            modifier(ToolbarTrailingModifier(item: content))
        }
    }
}
