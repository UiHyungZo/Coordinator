//
//  ProductsCoordinaotr.swift
//  CoordinatorMulti
//
//  Created by lukaOS on 2/4/25.
//

import Foundation
import UIKit

final class ProductsCoordinaotr:ChildCoordinator{
    var viewControllerRef: UIViewController?
    var parent:MerchCoordinator?
    var navigationController:UINavigationController
    
    init(navigationcontroller: UINavigationController) {
        self.navigationController = navigationcontroller
    }
    
    
    func start(animated: Bool) {
        
    }
    
    func coordinatorDidFinish() {
        <#code#>
    }
    

    
    
    
    
}
