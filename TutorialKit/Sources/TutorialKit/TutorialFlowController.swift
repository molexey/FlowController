//
//  TutorialFlowControllerViewController.swift
//  FlowController
//
//  Created by molexey on 12.05.2022.
//

import UIKit

public class TutorialFlowController: UINavigationController {
    
    public var didFinish: ((UINavigationController) -> Void)?
    
    public func start() {
        let viewController = self.viewControllers.first as? TutorialViewController
        viewController?.didFinish = { [weak self]  in self?.didFinish!(self!) }
    }
}
