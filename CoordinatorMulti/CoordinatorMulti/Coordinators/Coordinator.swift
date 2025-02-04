//
//  Coordinator.swift
//  CoordinatorMulti
//
//  Created by miris on 1/31/25.
//

import Foundation
import UIKit


protocol Coordinator: AnyObject{
    
    var navigationController: UINavigationController { get set }
    
    func start(animated: Bool)
    
    func popViewController(animated: Bool, useCustomAnimation: Bool, transitionType: CATransitionType)
    
}

extension Coordinator{
    
    func popViewController(animated: Bool, useCustomAnimation: Bool = false, transitionType:CATransitionType = .push){
        if useCustomAnimation{
            navigationController.customPopViewController(transitionType: transitionType)
        }else{
            navigationController.popViewController(animated: animated)
        }
    }
    
    func popToViewController(ofClass: AnyClass, animated: Bool = true){
        navigationController.popToViewController(ofClass: ofClass, animated: animated)
    }
    
    func popViewController(to viewController:UIViewController , animated:Bool , useCustomAnimation:Bool , transitionType:CATransitionType  = .push) {
        if useCustomAnimation {
            navigationController.customPopToViewController(viewController: viewController, transitionType: transitionType)
        } else {
            navigationController.popToViewController(viewController, animated: animated)
        }
    }
    
}

protocol ParentCoordinator: Coordinator{
    
    var childCoordinators: [Coordinator] { get set }
    
    func addChild(_ child: Coordinator?)
    
    func childDidFinish(_ child: Coordinator?)
    
}

extension ParentCoordinator{
    
    func addChild(_ child: Coordinator?){
        if let _child = child{
            childCoordinators.append(_child)
        }
    }
    
    func childDidFinish(_ child: Coordinator?){
        for (index, coordinator) in self.childCoordinators.enumerated() {
            if coordinator === child{
                self.childCoordinators.remove(at: index)
                break
            }
        }
    }
    
}

protocol ChildCoordinator: Coordinator{
    
    func coordinatorDidFinish()
    
    var viewControllerRef: UIViewController? {get set}
}
