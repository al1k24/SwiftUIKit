//
//  LazyView.swift
//  
//
//  Created by Alik Moldovanu on 15.01.2023.
//

import SwiftUI

public struct LazyView<Content: View>: View {
    private let content: () -> Content

    public init(_ content: @autoclosure @escaping() -> Content) {
        self.content = content
    }

    public var body: Content {
        content()
    }
}
