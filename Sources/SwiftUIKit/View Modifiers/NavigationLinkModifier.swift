//
//  NavigationLinkModifier.swift
//  
//
//  Created by Alik Moldovanu on 15.01.2023.
//

import SwiftUI

fileprivate struct NavigationLinkModifier<Destination: View>: ViewModifier {
    @ViewBuilder private let destination: () -> Destination
    
    init(destination: @escaping () -> Destination) {
        self.destination = destination
    }

    func body(content: Content) -> some View {
        if #available(iOS 15, *) {
            content
                .background(content: backgroundView)
        } else {
            content
                .background(backgroundView())
        }
    }
    
    private func backgroundView() -> some View {
        NavigationLink(destination: destination) {
            EmptyView()
        }
        .opacity(0)
    }
}

fileprivate struct NavigationLinkModifier2<Destination: View>: ViewModifier {
    @Binding private var isActive: Bool
    @ViewBuilder private let destination: () -> Destination
    
    init(isActive: Binding<Bool>, destination: @escaping () -> Destination) {
        self._isActive = isActive
        self.destination = destination
    }

    func body(content: Content) -> some View {
        if #available(iOS 15, *) {
            content
                .background(content: backgroundView)
        } else {
            content
                .background(backgroundView())
        }
    }
    
    private func backgroundView() -> some View {
        NavigationLink(isActive: $isActive, destination: destination) {
            EmptyView()
        }
        .opacity(0)
    }
}

extension View {
    
    /// Custom Navigation Link Modifier
    func navigationLink<Destination: View>(
        destination: @escaping () -> Destination
    ) -> some View {
        modifier(NavigationLinkModifier(destination: destination))
    }
    
    /// Custom Navigation Link Modifier
    func navigationLink<Destination: View>(
        isActive: Binding<Bool>,
        destination: @escaping () -> Destination
    ) -> some View {
        modifier(NavigationLinkModifier2(isActive: isActive, destination: destination))
    }
}
