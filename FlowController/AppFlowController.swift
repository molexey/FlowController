//
//  AppFlowController.swift
//  FlowController
//
//  Created by molexey on 12.05.2022.
//

import UIKit

final class AppFlowController: UIViewController {
    
    func start() {
        if AuthService.isAuthorized {
            startCabinet()
        } else {
            startTutorial()
        }
    }
    
    private func startTutorial() {
        let tutorialFlowController = TutorialFlowController(rootViewController: TutorialViewController())
        tutorialFlowController.flowDelegate = self
        add(childController: tutorialFlowController)
        tutorialFlowController.start()
    }
    
    private func startCabinet() {
        let cabinetFlowController = CabinetFlowController()
        cabinetFlowController.flowDelegate = self
        add(childController: cabinetFlowController)
        cabinetFlowController.start()
    }
}

extension AppFlowController: TutorialFlowControllerDelegate {
    func tutorialFlowControllerDidFinish(_ flowController: TutorialFlowController) {
        remove(childController: flowController)
        startCabinet()
    }
}

extension AppFlowController: CabinetFlowControllerDelegate {
    func cabinetFlowControllerDidFinish(_ flowController: CabinetFlowController) {
        remove(childController: flowController)
        //doSomething()
    }
}
