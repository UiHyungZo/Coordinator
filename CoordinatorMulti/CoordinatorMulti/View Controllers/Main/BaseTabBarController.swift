//
//  BaseTabBarController.swift
//  CoordinatorMulti
//
//  Created by Iker Casillas on 5/15/25.
//

import UIKit

final class BaseTabBarController: UITabBarController{
    weak var coordinator: RootCoordinator?
    
    private let authCoordinator = AuthCoordinator(navigationController: UINavigationController())
    let merchCoordinator = MerchCoordinator(navigationController: UINavigationController())
    private let greenCoordinator = GreenCoordinator(navigationController: UINavigationController())
    private let blueCoordinator = BlueCoordinator(navigationController: UINavigationController(), useTheMainMerchCoordinator: true)
    private let lavenderCoordnator = LavenderCoordinator(navigationController: UINavigationController())
    private (set) var initCoordinators = [Coordinator]()
    
    
    convenience init(coordinator: RootCoordinator) {
        self.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        UITabBar.appearance().barTintColor = .systemBackground
        tabBar.tintColor = .label
        
        authCoordinator.parent = coordinator
        merchCoordinator.parent = coordinator
        greenCoordinator.parent = coordinator
        blueCoordinator.parent = coordinator
        lavenderCoordnator.parent = coordinator
        
        for item in [authCoordinator, merchCoordinator, greenCoordinator, blueCoordinator, lavenderCoordnator] {
            coordinator?.addChild(item as? Coordinator)
        }
        
        authCoordinator.start()
        merchCoordinator.start()
        lavenderCoordnator.start(animated: false)
        blueCoordinator.start(animated: false)
        greenCoordinator.start(animated: false)

        initCoordinators = coordinator?.childCoordinators ?? []
        viewControllers = [greenCoordinator.navigationController, blueCoordinator.navigationController, lavenderCoordnator.navigationController]
        
        
    }
    
    func hideNavigationController(){
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
    func cleanUpMerch(){
        
    }
    
    func cleanUpZombieCoordinators(){
        
    }
    
}
