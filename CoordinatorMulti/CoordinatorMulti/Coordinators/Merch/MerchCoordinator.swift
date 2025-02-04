//
//  MerchCoordinator.swift
//  CoordinatorMulti
//
//  Created by miris on 2/3/25.
//

import UIKit

final class MerchCoordinator: ParentCoordinator{
    var parent: RootCoordinator?
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    
    init(navigationController:UINavigationController){
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        ///
    }
    
    func dismissMerchScreens(){
        let lastCoordinator = self.childCoordinators.popLast()
        for item in self.childCoordinators.reversed(){
            if item is ChildCoordinator{
                let childCoordinators = item as! ChildCoordinator
                if let viewController = childCoordinators.viewControllerRef as? DisposableViewController{
                    viewController.cleanUp()
                }
                childCoordinators.viewControllerRef?.navigationController?.popViewController(animated: false)
                self.childDidFinish(childCoordinators)
            }
        }
        lastCoordinator?.popViewController(animated: true, useCustomAnimation: false)
        navigationController.customPopToRootViewController()
    }
    
    
}
