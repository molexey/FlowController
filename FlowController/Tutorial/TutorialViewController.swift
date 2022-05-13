//
//  TutorialViewController.swift
//  FlowController
//
//  Created by molexey on 12.05.2022.
//

import UIKit

protocol TutorialViewControllerDelegate: AnyObject {
    func tutorialViewControllerDidFinish(_ controller: TutorialViewController)
}

class TutorialViewController: UIViewController {
    
    weak var getStartedButtonTapDelegate: TutorialViewControllerDelegate?
    
    let getStartedButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        title = "Tutorial"
        view.backgroundColor = .systemGray3
        
        getStartedButton.translatesAutoresizingMaskIntoConstraints = false
        getStartedButton.configuration = .filled()
        getStartedButton.setTitle("Get started", for: [])
        getStartedButton.addTarget(self, action: #selector(getStartedButtonTapped), for: .touchUpInside)
        
        view.addSubview(getStartedButton)
        
        NSLayoutConstraint.activate([
            getStartedButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            getStartedButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func getStartedButtonTapped(_ sender: UIButton) {
        getStartedButtonTapDelegate?.tutorialViewControllerDidFinish(self)
    }
}
