//
//  MerchCoordinator+Ext.swift
//  CoordinatorMulti
//
//  Created by Iker Casillas on 8/17/25.
//

import Foundation
import UIKit

extension MerchCoordinator {
    func products(navigationController: UINavigationController, animated: Bool) {
        let productsCoordinator = ProductsCoordinator(navigationController: navigationController)
        productsCoordinator.parent = self
        addChild(productsCoordinator)
        productsCoordinator.start(animated: animated)
    }
    
    func square(productID: String?, navigationController: UINavigationController, animated: Bool) {
        let squareCoordinator = SquareCoordinator(productID: productID, navigationController: navigationController)
        squareCoordinator.parent = self
        addChild(squareCoordinator)
        squareCoordinator.start(animated: animated)
    }
    
    func terms(text: String?, navigationController: UINavigationController, animated: Bool) {
        let messageViewerCoordinator = MessageViewerCoordinator(text: text, navigationController: navigationController)
        messageViewerCoordinator.parent = self
        addChild(messageViewerCoordinator)
        messageViewerCoordinator.start(animated: animated)
    }
}
