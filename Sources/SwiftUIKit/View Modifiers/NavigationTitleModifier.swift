//
//  NavigationTitleModifier.swift
//  
//
//  Created by Alik Moldovanu on 15.01.2023.
//

import SwiftUI

fileprivate struct NavigationTitleModifier<S>: ViewModifier where S : StringProtocol {
    private let title: S
    private let displayMode: NavigationBarItem.TitleDisplayMode
    
    init(title: S, displayMode: NavigationBarItem.TitleDisplayMode) {
        self.title = title
        self.displayMode = displayMode
    }
    
    func body(content: Content) -> some View {
        if #available(iOS 14.0, *) {
            content
                .navigationTitle(title)
                .navigationBarTitleDisplayMode(displayMode)
        } else {
            content
                .navigationBarTitle(Text(title), displayMode: displayMode)

        }
    }
}

fileprivate struct NavigationTitleModifier2: ViewModifier {
    private let titleKey: LocalizedStringKey
    private let displayMode: NavigationBarItem.TitleDisplayMode
    
    init(titleKey: LocalizedStringKey, displayMode: NavigationBarItem.TitleDisplayMode) {
        self.titleKey = titleKey
        self.displayMode = displayMode
    }
    
    func body(content: Content) -> some View {
        if #available(iOS 14.0, *) {
            content
                .navigationTitle(titleKey)
                .navigationBarTitleDisplayMode(displayMode)
        } else {
            content
                .navigationBarTitle(titleKey, displayMode: displayMode)

        }
    }
}

public extension View {
    func navigationTitle<S>(
        _ title: S,
        _ displayMode: NavigationBarItem.TitleDisplayMode = .inline
    ) -> some View where S : StringProtocol {
        modifier(NavigationTitleModifier(
            title: title,
            displayMode: displayMode
        ))
    }
    
    func navigationTitle(
        _ titleKey: LocalizedStringKey,
        _ displayMode: NavigationBarItem.TitleDisplayMode = .inline
    ) -> some View {
        modifier(NavigationTitleModifier2(
            titleKey: titleKey,
            displayMode: displayMode
        ))
    }
}
