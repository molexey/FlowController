//
//  LoginFlowController.swift
//  FlowController
//
//  Created by molexey on 12.05.2022.
//

import UIKit

protocol LoginFlowControllerDelegate: AnyObject {
    func loginFlowControllerDidFinish(_ flowController: LoginFlowController)
}

class LoginFlowController: UINavigationController {
    
    weak var flowDelegate: LoginFlowControllerDelegate?
    
    func start() {
        self.setTabBarItem(imageName: "person.circle.fill", title: "LOGIN")
        let loginViewController = self.viewControllers.first as! LoginViewController
        
        loginViewController.loginButtonTapDelegate = self
    }
    
    func startAuthorization() {
        let authorizationFlowController = AuthorizationFlowController(rootViewController: AuthorizationViewController())
        
        authorizationFlowController.flowDelegate = self
        authorizationFlowController.start()
        
        present(authorizationFlowController, animated: true)
    }
}

extension LoginFlowController: AuthorizationFlowControllerDelegate {
    func authorizationFlowControllerDidFinish(_ flowController: AuthorizationFlowController) {
        flowController.dismiss(animated: true, completion: nil)
    }
}

extension LoginFlowController: LoginViewControllerDelegate {
    func loginViewControllerDidFinish(_ viewController: LoginViewController) {
        startAuthorization()
    }
}
