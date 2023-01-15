//
//  UIApplication+.swift
//  
//
//  Created by Alik Moldovanu on 15.01.2023.
//

import UIKit

public extension UIApplication {
    var safeArea: UIEdgeInsets {
        return getKeyWindow()?.safeAreaInsets ?? .zero
    }
    
    func getKeyWindow() -> UIWindow? {
        if #unavailable(iOS 15.0) {
            return windows.first(where: { $0.isKeyWindow })
        }
        
        let connectedScenes = connectedScenes
            .filter({ $0.activationState == .foregroundActive })
            .compactMap({ $0 as? UIWindowScene })
        
        let window = connectedScenes.first?
            .windows
            .first(where: { $0.isKeyWindow })
        
        return window
    }
    
    func getTopController() -> UIViewController? {
        return getKeyWindow()?.visibleViewController() as? UIViewController
    }
}
