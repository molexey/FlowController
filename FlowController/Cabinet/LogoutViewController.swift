//
//  LogoutController.swift
//  FlowController
//
//  Created by molexey on 12.05.2022.
//

import UIKit

class LogoutViewController : UIViewController {
    
    var didFinish: (() -> Void)?
    
    private let logoutButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        logoutButton.translatesAutoresizingMaskIntoConstraints = false
        logoutButton.configuration = .filled()
        logoutButton.tintColor = .systemRed
        logoutButton.setTitle("LOGOUT", for: [])
        logoutButton.addTarget(self, action: #selector(logoutButtonTapped), for: .touchUpInside)
        
        view.addSubview(logoutButton)
        
        NSLayoutConstraint.activate([
            logoutButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoutButton.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])
    }
    
    @objc func logoutButtonTapped(_ sender: UIButton) {
        AuthService.isAuthorized = false
        didFinish?()
    }
}
