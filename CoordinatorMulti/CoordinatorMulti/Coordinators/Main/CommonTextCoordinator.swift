//
//  CommonTextCoordinator.swift
//  CoordinatorMulti
//
//  Created by Iker Casillas on 5/18/25.
//

import UIKit

final class CommonTextCoordinator: ChildCoordinator {
    var viewControllerRef: UIViewController?
    var parent: ParentCoordinator?
    
    var navigationController: UINavigationController
    private var text: String?
    
    init(text: String?, navigationController: UINavigationController) {
        self.navigationController = navigationController
        self.text = text
    }
    
    
    func start(animated: Bool) {
        let textViewerViewController = TextViewerViewController()
        textViewerViewController.text = self.text
        viewControllerRef = textViewerViewController
        textViewerViewController.coordinator = self
        navigationController.pushViewController(textViewerViewController, animated: animated)
    }
    
    func coordinatorDidFinish() {
        if let parent = parent as? RootCoordinator {
            parent.childDidFinish(self)
        }
    }
    
}
