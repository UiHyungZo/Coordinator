//
//  RootCoordinator.swift
//  CoordinatorMulti
//
//  Created by Iker Casillas on 5/15/25.
//

import Foundation
import UIKit

final class RootCoordinator: NSObject , ParentCoordinator {
    
    
    var childCoordinators = [Coordinator]()
    var navigationController: UINavigationController
    private(set) var baseTabBarController: BaseTabBarController?
    
    init(navigationController: UINavigationController){
        self.navigationController = navigationController
    }
    
    func start(animated: Bool) {
        let tabBar = BaseTabBarController(coordinator: self)
        baseTabBarController = tabBar
        navigationController.pushViewController(tabBar, animated: animated)
    }
    
}
