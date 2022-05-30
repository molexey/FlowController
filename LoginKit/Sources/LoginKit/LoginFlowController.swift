//
//  LoginFlowController.swift
//  FlowController
//
//  Created by molexey on 12.05.2022.
//

import UIKit
import AuthorizationKit

public class LoginFlowController: UINavigationController {
        
    public var didFinish: (() -> Void)?
    
    public func start() {
        self.setTabBarItem(imageName: "person.circle.fill", title: "LOGIN")
        
        let loginViewController = self.viewControllers.first as! LoginViewController
        
        loginViewController.didFinish = { [weak self] in self!.startAuthorization() }
    }
    
    func startAuthorization() {
        let authorizationFlowController = AuthorizationFlowController(rootViewController: AuthorizationViewController())
        
        authorizationFlowController.start()
        
        authorizationFlowController.didFinish = { [weak self] flowController in
            self!.didFinish?()
            flowController.dismiss(animated: true, completion: nil)
        }
        present(authorizationFlowController, animated: true)
    }
}

public extension UIViewController {
    func setTabBarItem(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
