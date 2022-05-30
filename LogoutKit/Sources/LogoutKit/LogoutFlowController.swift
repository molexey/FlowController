//
//  LogoutFlowController.swift
//  FlowController
//
//  Created by molexey on 20.05.2022.
//

import UIKit

public class LogoutFlowController: UINavigationController {
    
    public var didFinish: ((UINavigationController) -> Void)?
    
    public func start() {
        self.setTabBarItem(imageName: "arrow.right.circle.fill", title: "LOGOUT")
        let logoutViewController = self.viewControllers.first as! LogoutViewController
        logoutViewController.didFinish = { [weak self] in self?.didFinish!(self!) }
    }
}

public extension UIViewController {
    func setTabBarItem(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
