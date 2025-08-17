//
//  AuthCoordinator+Ext.swift
//  CoordinatorMulti
//
//  Created by Iker Casillas on 8/17/25.
//

import UIKit

extension AuthCoordinator{
    func login(navigationController: UINavigationController, animated: Bool) {
        let loginCoordinator = LoginCoordinator(navigationController: navigationController)
        loginCoordinator.parent = self
        addChild(loginCoordinator)
        loginCoordinator.start(animated: animated)
    }
    
    func register(navigationController: UINavigationController, animated: Bool) {
        let registerCoordinator = RegisterCoordinator(navigationController: navigationController)
        registerCoordinator.parent = self
        addChild(registerCoordinator)
        registerCoordinator.start(animated: animated)
    }
    
    func forgotPassword(navigationController: UINavigationController, animated: Bool) {
        let forgotPasswordCoordinator = ForgotPasswordCoordinator(navigationController: navigationController)
        forgotPasswordCoordinator.parent = self
        addChild(forgotPasswordCoordinator)
        forgotPasswordCoordinator.start(animated: animated)
    }
}
