//
//  CabinetControllerViewController.swift
//  FlowController
//
//  Created by molexey on 12.05.2022.
//

import UIKit

class CabinetFlowController: UITabBarController {
    
    func start() {
        let loginFlowController = LoginFlowController()
        let logoutController = LogoutViewController()
        
        loginFlowController.tabBarItem = UITabBarItem(title: "LOGIN", image: UIImage(systemName: "person.circle.fill"), selectedImage: UIImage(systemName: "person.circle.fill"))
        
        logoutController.tabBarItem = UITabBarItem(title: "LOGOUT", image: UIImage(systemName: "arrow.right.circle.fill"), selectedImage: UIImage(systemName: "arrow.right.circle.fill"))
        
        viewControllers = [loginFlowController, logoutController]
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}
