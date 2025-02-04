//
//  RootCoordinator.swift
//  CoordinatorMulti
//
//  Created by miris on 1/31/25.
//

import Foundation
import UIKit

final class RootCoordinator: NSObject, Coordinator, ParentCoordinator{
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    
    var baseTabBarController: BaseTabBarController?
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        self.baseTabBarController = BaseTabBarController(coordinator: self)
        baseTabBarController!.coordinator = self
        navigationController.pushViewController(baseTabBarController!, animated: animated)
    }
    
    func cleanUpMerch(){
        
    }
    
    
}
