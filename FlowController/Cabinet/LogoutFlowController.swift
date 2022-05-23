//
//  LogoutFlowController.swift
//  FlowController
//
//  Created by molexey on 20.05.2022.
//

import UIKit

class LogoutFlowController: UINavigationController {
    
    var didFinish: ((UINavigationController) -> Void)?
    
    func start() {
        self.setTabBarItem(imageName: "arrow.right.circle.fill", title: "LOGOUT")
        let logoutViewController = self.viewControllers.first as! LogoutViewController
        logoutViewController.didFinish = { [weak self] in self?.didFinish!(self!) }
    }
}
