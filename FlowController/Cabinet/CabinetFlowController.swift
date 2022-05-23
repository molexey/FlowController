//
//  CabinetControllerViewController.swift
//  FlowController
//
//  Created by molexey on 12.05.2022.
//

import UIKit

protocol CabinetFlowControllerDelegate: AnyObject {
    func cabinetFlowControllerDidFinish(_ flowcontroller: CabinetFlowController)
}

class CabinetFlowController: UITabBarController {
    
    weak var flowDelegate: CabinetFlowControllerDelegate?
    
    func start() {
        var tabBars = [UIViewController]()
        
        let loginFlowController = LoginFlowController(rootViewController: LoginViewController())
        loginFlowController.start()
        tabBars.append(loginFlowController)
        
        let logoutFlowController = LogoutFlowController(rootViewController: LogoutViewController())
        logoutFlowController.flowDelegate = self
        logoutFlowController.start()
        tabBars.append(logoutFlowController)
        
        setViewControllers(tabBars, animated: false)
    }
}

extension CabinetFlowController: LogoutFlowControllerDelegate {
    func logoutFlowControllerDidFinish(_ flowController: LogoutFlowController) {
        remove(childController: flowController)        
//        flowDelegate?.cabinetFlowControllerDidFinish(self)
        start()
    }
}
