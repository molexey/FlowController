//
//  TutorialFlowControllerViewController.swift
//  FlowController
//
//  Created by molexey on 12.05.2022.
//

import UIKit

class TutorialFlowController: UINavigationController {
    
    var didFinish: ((UINavigationController) -> Void)?
    
    func start() {
        let viewController = self.viewControllers.first as? TutorialViewController
        viewController?.didFinish = { [weak self]  in self?.didFinish!(self!) }
    }
}
