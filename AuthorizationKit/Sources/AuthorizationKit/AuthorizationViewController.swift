//
//  AuthorizationController.swift
//  FlowController
//
//  Created by molexey on 12.05.2022.
//

import UIKit

public class AuthorizationViewController : UIViewController {
    
    public var didFinish: (() -> Void)?
        
    let authorizationButton = UIButton()
        
    public override func viewDidLoad() {
        super.viewDidLoad()
        title = "Please authorize"
        view.backgroundColor = .systemBackground
        
        authorizationButton.translatesAutoresizingMaskIntoConstraints = false
        authorizationButton.configuration = .filled()
        authorizationButton.setTitle("Authorize", for: [])
        authorizationButton.addTarget(self, action: #selector(authorizationButtonTapped), for: .touchUpInside)
        
        view.addSubview(authorizationButton)
        
        NSLayoutConstraint.activate([
            authorizationButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            authorizationButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func authorizationButtonTapped(_ sender: UIButton) {
        AuthService.isAuthorized = true
        didFinish?()
    }
}
