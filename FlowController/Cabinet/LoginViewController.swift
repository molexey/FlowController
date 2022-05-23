//
//  LoginController.swift
//  FlowController
//
//  Created by molexey on 12.05.2022.
//

import UIKit

protocol LoginViewControllerDelegate: AnyObject {
    func loginViewControllerDidFinish(_ controller: LoginViewController)
}

class LoginViewController : UIViewController {
    
    private let loginButton = UIButton()
        
    weak var loginButtonTapDelegate: LoginViewControllerDelegate?
            
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        loginButton.configuration = .filled()
        loginButton.setTitle("LOGIN", for: [])
        loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        
        view.addSubview(loginButton)
        
        NSLayoutConstraint.activate([
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func loginButtonTapped(_ sender: UIButton) {
        loginButtonTapDelegate?.loginViewControllerDidFinish(self)
    }
}
