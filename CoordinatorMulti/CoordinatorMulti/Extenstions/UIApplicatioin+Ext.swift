//
//  UIApplicatioin+Ext.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-28.
//

import Foundation
import UIKit

extension UIApplication {
    func topViewController() -> UIViewController?{
        guard let keyWindow = getKeyWindow() else {return nil}
        var topVC = keyWindow.rootViewController
        
        while let presentedVC = topVC?.presentedViewController{
            topVC = presentedVC
        }
        
        if let navController = topVC as? UINavigationController{
            return navController.topViewController
        }
        
        if let tabBarController = topVC as? UITabBarController{
            return tabBarController.selectedViewController
        }
        
        return topVC
    }
    
    func topNavigationController() -> UINavigationController? {
        return topViewController()?.navigationController
    }
    
    private func getKeyWindow() -> UIWindow? {
        if #available(iOS 13.0, *) {
            return connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first { $0.isKeyWindow }
        } else {
            return UIApplication.shared.windows.first { $0.isKeyWindow }
        }
    }

}

