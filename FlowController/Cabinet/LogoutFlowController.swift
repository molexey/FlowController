//
//  LogoutFlowController.swift
//  FlowController
//
//  Created by molexey on 20.05.2022.
//

import UIKit

protocol LogoutFlowControllerDelegate: AnyObject {
    func logoutFlowControllerDidFinish(_ flowController: LogoutFlowController)
}

class LogoutFlowController: UINavigationController {
    
    weak var flowDelegate: LogoutFlowControllerDelegate?
    
    func start() {
        self.setTabBarItem(imageName: "arrow.right.circle.fill", title: "LOGOUT")
        let logoutViewController = self.viewControllers.first as! LogoutViewController
        logoutViewController.logoutButtonTapDelegate = self
    }
}

extension LogoutFlowController: LogoutViewControllerDelegate {
    func logoutViewControllerDidFinish(_ controller: LogoutViewController) {
        flowDelegate?.logoutFlowControllerDidFinish(self)
    }
}
