//
//  LoginFlowController.swift
//  FlowController
//
//  Created by molexey on 12.05.2022.
//

import UIKit

final class LoginFlowController: UINavigationController {
        
    private lazy var loginViewController = LoginViewController()
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private lazy var presentAuthorization: (() -> Void) = { [weak self] in
        let authorizationFlowController = AuthorizationFlowController()
        authorizationFlowController.authorizationDidFinish = self?.authorizationDidFinish
        authorizationFlowController.start()
        self?.present(authorizationFlowController, animated: true)
    }
    
    private lazy var authorizationDidFinish: ((UIViewController) -> Void) = { viewController in
        viewController.dismiss(animated: true, completion: nil)
        self.loginViewController.viewWillAppear(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        loginViewController.presentAuthorization = presentAuthorization
        self.pushViewController(loginViewController, animated: true)
    }
}
