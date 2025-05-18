//
//  MerchCoordinator.swift
//  CoordinatorMulti
//
//  Created by Iker Casillas on 5/18/25.
//

import UIKit

final class MerchCoordinator: ParentCoordinator{
    weak var parent: RootCoordinator?
    
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    
    func start(animated: Bool = false) {
        
    }
    
    func dismissMerchScreens(){
        let lastCoordinator = childCoordinators.popLast()
        for item in childCoordinators.reversed() {
            if item is ChildCoordinator {
                let childCoordinator = item as! ChildCoordinator
                if let viewController = childCoordinator.viewControllerRef as? DisposableViewController {
                    viewController.cleanUp()
                }
                childCoordinator.viewControllerRef?.navigationController?.popViewController(animated: false)
                self.childDidFinish(childCoordinator)
            }
        }
        lastCoordinator?.popViewController(animated: true, useCustomAnimation: false)
        navigationController.customPopToRootViewController()
    }
    
    
}
