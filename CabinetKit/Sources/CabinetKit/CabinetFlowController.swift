//
//  CabinetControllerViewController.swift
//  FlowController
//
//  Created by molexey on 12.05.2022.
//

import UIKit
import LoginKit
import LogoutKit

public class CabinetFlowController: UITabBarController {
    
    public var didFinish: ((UITabBarController) -> Void)?
    
    public func start() {
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
