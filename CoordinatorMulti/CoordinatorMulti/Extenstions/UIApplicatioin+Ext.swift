//
//  UIApplicatioin+Ext.swift
//  coordinator
//
//  Created by Maysam Shahsavari on 2023-01-28.
//

import Foundation
import UIKit

extension UIApplication {
    func topViewController() -> UIViewController? {
        var topViewController: UIViewController? = nil
        if #available(iOS 13, *) {
            for scene in connectedScenes {
                if let windowScene = scene as? UIWindowScene {
                    for window in windowScene.windows {
                        if window.isKeyWindow {
                            topViewController = window.rootViewController
                        }
                    }
                }
            }
        } else {
            topViewController = keyWindow?.rootViewController
        }
        while true {
            if let presented = topViewController?.presentedViewController {
                topViewController = presented
            } else if let navController = topViewController as? UINavigationController {
                topViewController = navController.topViewController
            } else if let tabBarController = topViewController as? UITabBarController {
                topViewController = tabBarController.selectedViewController
            } else {
                /// Handle any other third party container in `else if` if required
                break
            }
        }
        return topViewController
    }
    
    func topNavigatioinController() -> UINavigationController? {
        return topViewController()?.navigationController
    }
}

/*
extension UIApplication {
    
    var activeKeyWindow: UIWindow? {
        if #available(iOS 13.0, *) {
            return connectedScenes
                .compactMap { $0 as? UIWindowScene }
                .flatMap { $0.windows }
                .first(where: { $0.isKeyWindow })
        } else {
            return keyWindow // 여기서도 warning 나지만, iOS 12 이하용으로 fallback 용도
        }
    }
    
    func topViewController(base: UIViewController? = nil) -> UIViewController?{
        let baseVC = base ?? activeKeyWindow?.rootViewController
        
        if let nav = baseVC as? UINavigationController {
            return topViewController(base: nav.visibleViewController)
        }
        
        if let tab = baseVC as? UITabBarController,
           let selected = tab.selectedViewController {
            return topViewController(base: selected)
        }
        
        if let presented = baseVC?.presentedViewController {
            return topViewController(base: presented)
        }

        
        return baseVC
        
    }
    
    private func getKeyWindow() -> UIWindow?{
        if #available(iOS 15.0, *){
            return connectedScenes
                .compactMap{ $0 as? UIWindowScene }
                .flatMap{ $0.windows }
                .first{ $0.isKeyWindow }
        }else{
            return windows.first {$0.isKeyWindow} ?? keyWindow
        }
    }
    
    func topNavigationController() -> UINavigationController? {
        return topViewController()?.navigationController
    }
    
    func showAlert(title: String, message: String){
        guard let topVC = topViewController()
                ,!(topVC is UIAlertController) else {return}
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        
        DispatchQueue.main.async {
            topVC.present(alert, animated: true)
        }
    }
    
    
}
*/
