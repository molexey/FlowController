//
//  AppFlowController.swift
//  FlowController
//
//  Created by molexey on 12.05.2022.
//

import UIKit
import CabinetKit
import AuthorizationKit
import TutorialKit

final class AppFlowController: UIViewController {
    
    public func start() {
        if AuthService.isAuthorized {
            startCabinet()
        } else {
            startTutorial()
        }
    }
    
    private func startTutorial() {
        let tutorialFlowController = TutorialFlowController(rootViewController: TutorialViewController())
        tutorialFlowController.didFinish = { [weak self] flowController in
            self!.remove(childController: flowController)
            self!.startCabinet()
        }
        add(childController: tutorialFlowController)
        tutorialFlowController.start()
    }
    
    private func startCabinet() {
        let cabinetFlowController = CabinetFlowController()
        cabinetFlowController.didFinish = { [weak self] flowController in
            //startSomething()
            //self!.remove(childController: flowController)
        }
        add(childController: cabinetFlowController)
        cabinetFlowController.start()
    }
}
