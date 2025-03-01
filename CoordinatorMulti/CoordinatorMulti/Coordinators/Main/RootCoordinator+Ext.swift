//
//  RootCoordinator+Ext.swift
//  CoordinatorMulti
//
//  Created by lukaOS on 2/4/25.
//

import Foundation
import UIKit

extension RootCoordinator{
    
    //MARK: - Merch
    func products(useTheMainMerchCoordinator: Bool){
        var topNavigationController: UINavigationController?
        topNavigationController = UIApplication.shared.topNavigatioinController()
        
        if let topNavigationController{
            if useTheMainMerchCoordinator{
                for child in childCoordinators{
                    if child is MerchCoordinator{
                        let merchCoordinator = child as! MerchCoordinator
                        
                        
                    }
                }
            }else{
                let newMerchCoordinator = MerchCoordinator(navigationController: UINavigationController())
                addChild(newMerchCoordinator)
                
            }
        }
        
    }
}
