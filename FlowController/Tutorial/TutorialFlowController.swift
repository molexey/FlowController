//
//  TutorialFlowControllerViewController.swift
//  FlowController
//
//  Created by molexey on 12.05.2022.
//

import UIKit

protocol TutorialFlowControllerDelegate: AnyObject {
    func tutorialFlowControllerDidFinish(_ flowController: TutorialFlowController)
}

class TutorialFlowController: UINavigationController {
    
    weak var flowDelegate: TutorialFlowControllerDelegate?
    
    func start() {
        let viewController = self.viewControllers.first as? TutorialViewController
        viewController!.getStartedButtonTapDelegate = self
    }
}

extension TutorialFlowController: TutorialViewControllerDelegate {
    func tutorialViewControllerDidFinish(_ viewController: TutorialViewController) {
        flowDelegate?.tutorialFlowControllerDidFinish(self)
    }
}
