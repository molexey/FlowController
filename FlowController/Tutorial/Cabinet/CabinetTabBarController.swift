//
//  CabinetTabBarController.swift
//  FlowController
//
//  Created by molexey on 20.05.2022.
//

import UIKit

class CabinetTabBarController: UITabBarController {
    
}

extension UIViewController {
    func setTabBarItem(imageName: String, title: String) {
        let configuration = UIImage.SymbolConfiguration(scale: .large)
        let image = UIImage(systemName: imageName, withConfiguration: configuration)
        tabBarItem = UITabBarItem(title: title, image: image, tag: 0)
    }
}
