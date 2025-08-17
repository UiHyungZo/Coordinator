//
//  LoginCoordinator.swift
//  CoordinatorMulti
//
//  Created by Iker Casillas on 8/17/25.
//

import Foundation
import UIKit

final class LoginCoordinator: ChildCoordinator {
    var viewControllerRef: UIViewController?
    var parent: AuthCoordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let loginViewController = LoginViewController()
        viewControllerRef = loginViewController
        loginViewController.coordinator = self
        navigationController.customPushViewController(viewController: loginViewController)
    }
    
    func register() {
        parent?.register(navigationController: navigationController, animated: true)
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
    
    func dismissAuthScreens() {
        parent?.dismissAuthScreens()
    }
}
