//
//  TextViewerViewController.swift
//  CoordinatorMulti
//
//  Created by lukaOS on 2/4/25.
//

import UIKit

class TextViewerViewController:UIViewController, DisposableViewController{
    weak var coordinator: ChildCoordinator?
    private let label = UILabel()
    
    var text:String?
    
    override func loadView() {
        view = UIView()
        view.backgroundColor = .init(red: 1, green: 1, blue: 1, alpha: 1)
        
        view.addSubview(label)
        label.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            label.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            label.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        label.text = self.text
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        if self.isMovingFromParent{
            cleanUp()
        }
    }
    
    func cleanUp() {
        coordinator?.coordinatorDidFinish()
    }
    
    deinit {
        ConsoleLogger.classDeInitialized()
    }
    
    
}
