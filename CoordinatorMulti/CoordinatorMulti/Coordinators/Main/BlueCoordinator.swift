//
//  BlueCoordinator.swift
//  CoordinatorMulti
//
//  Created by Iker Casillas on 5/18/25.
//

import UIKit

final class BlueCoordinator: ChildCoordinator {
    
    
    var viewControllerRef: UIViewController?
    var parent: RootCoordinator?
    var navigationController: UINavigationController
    private var useTheMainMerchCoordinator: Bool
    
    init(navigationController: UINavigationController, useTheMainMerchCoordinator: Bool) {
        self.navigationController = navigationController
        self.useTheMainMerchCoordinator = useTheMainMerchCoordinator
    }
    
    func start(animated: Bool) {
        let blueViewController = BlueViewController()
        viewControllerRef = blueViewController
        blueViewController.coordinator = self
        blueViewController.tabBarItem = UITabBarItem(title: "Blue", image: UIImage(systemName: "magnifyingglass.circle.fill"), selectedImage: nil)
        navigationController.pushViewController(blueViewController, animated: animated)
    }
    
    func products(){
        
    }
    
    func coordinatorDidFinish(){
        parent?.childDidFinish(self)
    }
    
    func cleanUpMerch() {
        
    }
    
    
}
