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
    
    func commonText(text: String?, navigationController: UINavigationController, animated: Bool){
        let commonTextCoordinator = CommonTextCoordinator(text: text, navigationController: navigationController)
        commonTextCoordinator.parent = self
        addChild(commonTextCoordinator)
        commonTextCoordinator.start(animated: animated)
    }
}
