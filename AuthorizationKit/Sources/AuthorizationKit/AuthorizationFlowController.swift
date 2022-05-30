//
//  AuthorizationFlowController.swift
//  FlowController
//
//  Created by molexey on 13.05.2022.
//

import UIKit

public class AuthorizationFlowController: UINavigationController {
    
    public var didFinish: ((UINavigationController) -> Void)?
    
    public func start() {
        let authorizationViewController = self.viewControllers.first as? AuthorizationViewController
        
        authorizationViewController?.didFinish = { [weak self] in self?.didFinish!(self!) }
    }
}
