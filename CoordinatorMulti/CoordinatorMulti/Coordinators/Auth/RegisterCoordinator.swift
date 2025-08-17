//
//  RegisterCoordinator.swift
//  CoordinatorMulti
//
//  Created by Iker Casillas on 8/17/25.
//


import Foundation
import UIKit

final class RegisterCoordinator: ChildCoordinator {
    var viewControllerRef: UIViewController?
    var parent: AuthCoordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let registerViewController = RegisterViewController()
        viewControllerRef = registerViewController
        registerViewController.coordinator = self
        navigationController.pushViewController(registerViewController, animated: animated)
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
    
    func forgotPassword() {
        parent?.forgotPassword(navigationController: navigationController, animated: true)
    }
    
    func dismissAuthScreen() {
        parent?.dismissAuthScreens()
    }
}
