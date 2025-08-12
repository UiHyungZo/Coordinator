//
//  GreenCoordinator.swift
//  CoordinatorMulti
//
//  Created by Iker Casillas on 5/18/25.
//

import UIKit

final class GreenCoordinator: ChildCoordinator {
    var viewControllerRef: UIViewController?
    var parent:RootCoordinator?
    var navigationController:UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    
    func start(animated: Bool){
        let greenViewController = GreenViewController()
        viewControllerRef = greenViewController
        greenViewController.coordinator = self
        greenViewController.tabBarItem = UITabBarItem(title: "Green", image: UIImage(systemName: "house.fill"), selectedImage: nil)
        navigationController.pushViewController(greenViewController, animated: animated)
    }
    
    func commonText(_ text: String?){
        parent?.commonText(text: text, navigationController: navigationController, animated: true)
    }
    
    func blueScreen(){
        parent?.blueScreen(useTheMainMerchCoordinator: false, navigationController: navigationController, animated: true)
    }
    
    
    func coordinatorDidFinish() {
        parent?.childDidFinish(self)
    }
    
    func cleanUpZombieCoordinators(){
        parent?.baseTabBarController?.cleanUpZombieCoordinators()
    }
    
    
    
}
