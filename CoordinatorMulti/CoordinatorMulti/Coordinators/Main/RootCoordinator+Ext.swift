//
//  RootCoordinator+Ext.swift
//  CoordinatorMulti
//
//  Created by Iker Casillas on 5/18/25.
//

import UIKit

extension RootCoordinator {
    func greenScreen(navigationController: UINavigationController, animated: Bool){
        let greenCoordinator = GreenCoordinator(navigationController: navigationController)
        greenCoordinator.parent = self
        addChild(greenCoordinator)
        greenCoordinator.start(animated: animated)
    }
    
    func blueScreen(useTheMainMerchCoordinator: Bool, navigationController: UINavigationController, animated: Bool) {
        let blueCoordinator = BlueCoordinator(navigationController: navigationController, useTheMainMerchCoordinator: useTheMainMerchCoordinator)
        blueCoordinator.parent = self
        addChild(blueCoordinator)
        blueCoordinator.start(animated: animated)
    }
    
    func commonText(text: String?, navigationController: UINavigationController, animated: Bool){
        let commonTextCoordinator = CommonTextCoordinator(text: text, navigationController: navigationController)
        commonTextCoordinator.parent = self
        addChild(commonTextCoordinator)
        commonTextCoordinator.start(animated: animated)
    }
    
    
    func products(useTheMainMerchCoordinator: Bool){
        var topNavigationController: UINavigationController?
        topNavigationController = UIApplication.shared.topNavigationController()
    }
}
