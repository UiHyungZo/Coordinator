//
//  UINavigationCotroller+Ext.swift
//  CoordinatorMulti
//
//  Created by miris on 1/31/25.
//

import UIKit

private let durationTime: CFTimeInterval = 0.25


public extension UINavigationController{
    
    enum VCTransition{
        case fromTop
        case fromBottom
        case fromLeft
        case fromRight
    }
    /*
     현재 화면을 이전 화면으로 pop할때
     */
    func customPopViewController(direction: VCTransition = .fromTop, transitionType: CATransitionType = .push) {
        self.addTransition(transitionDirection: direction, transitionType: transitionType)
        self.popViewController(animated: false)
    }
    /*
     특정 클래스의 뷰 컨트롤러로 pop하는 기능
     viewControllers의 배열에서 마지막 뷰 컨트롤러를 찾아 popToViewController실행
     */
    
    func popToViewController(ofClass: AnyClass, animated: Bool = true) {
        if let vc = viewControllers.last(where: { $0.isKind(of: ofClass) }) {
            popToViewController(vc, animated: animated)
        }
    }
    /*
     popToRootViewController를 실행하되, 커스텀 애니메이션을 추가합니다.
     */
    func customPopToRootViewController(direction: VCTransition = .fromTop, transitionType: CATransitionType = .push) {
        self.addTransition(transitionDirection: direction, transitionType: transitionType)
        self.popToRootViewController(animated: false)
    }
    /*
     특정 뷰 컨트롤러로 pop할 때 커스텀 애니메이션을 추가합니다.
     */
    func customPopToViewController(viewController vc: UIViewController, direction: VCTransition = .fromTop, transitionType: CATransitionType = .push) {
        self.addTransition(transitionDirection: direction, transitionType: transitionType)
        self.popToViewController(vc, animated: false)
    }
    
    func customPushViewController(viewController vc: UIViewController, direction: VCTransition = .fromBottom, transitionType: CATransitionType = .push) {
        self.addTransition(transitionDirection: direction, transitionType: transitionType)
        self.pushViewController(vc, animated: false)
    }
    
    
    private func addTransition(transitionDirection direction:VCTransition, transitionType: CATransitionType = .push, duration:CFTimeInterval = durationTime){
        let transition = CATransition()
        transition.duration = duration
        transition.type = transitionType
        transition.timingFunction = .init(name: .easeInEaseOut)
        
        switch direction {
        case .fromBottom: transition.subtype = .fromBottom
        case .fromTop: transition.subtype = .fromTop
        case .fromLeft: transition.subtype = .fromLeft
        case .fromRight: transition.subtype = .fromRight
        }
        
        view.layer.add(transition, forKey: kCATransition)
        
    }
    
    
    
}
