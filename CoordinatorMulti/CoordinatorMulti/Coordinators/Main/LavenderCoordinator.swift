//
//  LavenderCoordinator.swift
//  CoordinatorMulti
//
//  Created by Iker Casillas on 5/18/25.
//

import UIKit

final class LavenderCoordinator: ChildCoordinator {
    var viewControllerRef: UIViewController?
    
    var parent: RootCoordinator?
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let lavenderViewController = LavenderViewController()
        viewControllerRef = lavenderViewController
        lavenderViewController.coordinator = self
        lavenderViewController.tabBarItem = UITabBarItem(title: "Lavender", image: UIImage(systemName: "gear.circle.fill"), selectedImage: nil)
        navigationController.pushViewController(lavenderViewController, animated: animated)
    }
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
    
    func login(){
        parent?.login()
    }
    
    
}
