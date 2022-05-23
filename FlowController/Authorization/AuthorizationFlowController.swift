//
//  AuthorizationFlowController.swift
//  FlowController
//
//  Created by molexey on 13.05.2022.
//

import UIKit

protocol AuthorizationFlowControllerDelegate: AnyObject {
    func authorizationFlowControllerDidFinish(_ flowController: AuthorizationFlowController)
}

class AuthorizationFlowController: UINavigationController {
    
    weak var flowDelegate: AuthorizationFlowControllerDelegate?
            
    func start() {
        let controller = self.viewControllers.first as? AuthorizationViewController
        controller!.authorizeButtonTapDelegate = self        
    }
}

extension AuthorizationFlowController: AuthorizationViewControllerDelegate {
    func authorizationViewControllerDidFinish(_ controller: AuthorizationViewController) {
        flowDelegate?.authorizationFlowControllerDidFinish(self)
//        self.dismiss(animated: true, completion: nil)
    }
}
