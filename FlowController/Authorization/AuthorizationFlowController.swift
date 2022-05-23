//
//  AuthorizationFlowController.swift
//  FlowController
//
//  Created by molexey on 13.05.2022.
//

import UIKit


class AuthorizationFlowController: UINavigationController {
        
    var didFinish: ((UINavigationController) -> Void)?
            
    func start() {
        let authorizationViewController = self.viewControllers.first as? AuthorizationViewController
        
        authorizationViewController?.didFinish = { [weak self] in self?.didFinish!(self!) }
    }
}
