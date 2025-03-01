//
//  BaseTabBarController.swift
//  CoordinatorMulti
//
//  Created by miris on 1/31/25.
//

import UIKit

final class BaseTabBarController: UITabBarController{
    weak var coordinator: RootCoordinator?
    
    private let authCoordinator = AuthCoordinator(navigationController: UINavigationController())
    let merchCoordinator = MerchCoordinator(navigationController: UINavigationController())
    
    
    init(coordinator: RootCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: "BaseTabBarController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
    }
    
    func hideNavigationController(){
        self.navigationController?.setNavigationBarHidden(true, animated: false)
    }
    
}
