//
//  AuthorizationController.swift
//  FlowController
//
//  Created by molexey on 12.05.2022.
//

import UIKit

class AuthorizationViewController : UIViewController {
    
    let authorizationButton = UIButton()
    
    var authorizationDidFinish: ((UIViewController) -> Void)?
    
    init() {
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
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
        if let authorizationDidFinish = authorizationDidFinish {
            authorizationDidFinish(self)
        }
        AuthService.isAuthorized = true
    }
    
}
