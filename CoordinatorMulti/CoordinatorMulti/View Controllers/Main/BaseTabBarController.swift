//
//  BaseTabBarController.swift
//  CoordinatorMulti
//
//  Created by Iker Casillas on 5/15/25.
//

import UIKit

final class BaseTabBarController: UITabBarController{
    weak var coordinator: RootCoordinator?
    
    convenience init(coordinator: RootCoordinator) {
        self.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        
        
    }
    
    func hideNavigationController(){
        
    }
    
}
