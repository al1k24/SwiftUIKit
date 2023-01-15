//
//  UIWindow+.swift
//  
//
//  Created by Alik Moldovanu on 15.01.2023.
//

import UIKit

public extension UIWindow {
    func visibleViewController() -> UIViewController? {
        if let rootViewController: UIViewController = self.rootViewController {
            return UIWindow.getVisibleViewController(from: rootViewController)
        }
        
        return nil
    }
    
    static func getVisibleViewController(from vc: UIViewController) -> UIViewController {
        if let navigationController = vc as? UINavigationController,
           let visibleController = navigationController.visibleViewController {
            return UIWindow.getVisibleViewController(from: visibleController)
        }
        
        if let tabBarController = vc as? UITabBarController,
           let selectedTabController = tabBarController.selectedViewController {
            return UIWindow.getVisibleViewController(from: selectedTabController)
        }
        
        if let presentedViewController = vc.presentedViewController {
            return UIWindow.getVisibleViewController(from: presentedViewController)
        }
        
        return vc
    }
}
