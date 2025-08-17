//
//  ProductsCoordinator.swift
//  CoordinatorMulti
//
//  Created by Iker Casillas on 8/17/25.
//


import Foundation
import UIKit

final class ProductsCoordinator: ChildCoordinator {
    var viewControllerRef: UIViewController?
    var parent: MerchCoordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let productsViewController = ProductsViewController()
        viewControllerRef = productsViewController
        productsViewController.coordinator = self
        navigationController.pushViewController(productsViewController, animated: animated)
    }
    
    func product(ID: String) {
        parent?.square(productID: ID, navigationController: navigationController, animated: true)
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
    
    func dismissAuthScreen() {
        parent?.dismissMerchScreens()
    }
}
