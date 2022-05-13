//
//  AuthorizationFlowController.swift
//  FlowController
//
//  Created by molexey on 13.05.2022.
//

import Foundation
import UIKit

class AuthorizationFlowController: UINavigationController {
    
    var authorizationDidFinish: ((UIViewController) -> Void)?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func start() {
        let authorizationViewController = AuthorizationViewController()
        authorizationViewController.authorizationDidFinish = authorizationDidFinish
        self.pushViewController(authorizationViewController, animated: true)
    }
}
