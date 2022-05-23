//
//  CabinetControllerViewController.swift
//  FlowController
//
//  Created by molexey on 12.05.2022.
//

import UIKit

class CabinetFlowController: UITabBarController {
        
    var didFinish: ((UITabBarController) -> Void)?
    
    func start() {
        var tabBars = [UIViewController]()
        
        let loginFlowController = LoginFlowController(rootViewController: LoginViewController())
        loginFlowController.start()
        tabBars.append(loginFlowController)
        
        let logoutFlowController = LogoutFlowController(rootViewController: LogoutViewController())
        
        logoutFlowController.didFinish = { [weak self] flowController in
            self!.didFinish?(self!)
            self!.remove(childController: flowController)
            self!.start()
        }
        
        logoutFlowController.start()
        tabBars.append(logoutFlowController)
        
        setViewControllers(tabBars, animated: false)
    }
}
