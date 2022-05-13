//
//  TutotialFlowControllerViewController.swift
//  FlowController
//
//  Created by molexey on 12.05.2022.
//

import UIKit

protocol TutorialFlowControllerDelegate: AnyObject {
    func tutorialFlowControllerDidFinish(_ flowController: TutorialFlowController)
}

class TutorialFlowController: UIViewController {
    
    weak var delegate: TutorialFlowControllerDelegate?
    private var embeddedNavigationController: UINavigationController!
    
    init() {
        super.init(nibName: nil, bundle: nil)
        
        embeddedNavigationController = UINavigationController()
        add(childController: embeddedNavigationController)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func start() {
        let controller = TutorialViewController()
        controller.getStartedButtonTapDelegate = self
        embeddedNavigationController.viewControllers = [controller]
    }

}

extension TutorialFlowController: TutorialViewControllerDelegate {
    func tutorialViewControllerDidFinish(_ controller: TutorialViewController) {
        remove(childController: controller)
        delegate?.tutorialFlowControllerDidFinish(self)
    }
}
