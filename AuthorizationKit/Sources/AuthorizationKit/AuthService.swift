//
//  AuthService.swift
//  FlowController
//
//  Created by molexey on 12.05.2022.
//

import Foundation

public class AuthService {
    
    private enum Keys: String {
        case isAuthorized
    }
    
    public static var isAuthorized: Bool {
        get {
            return UserDefaults.standard.bool(forKey: Keys.isAuthorized.rawValue)
        }
        set(newValue) {
            UserDefaults.standard.set(newValue, forKey: Keys.isAuthorized.rawValue)
            UserDefaults.standard.synchronize()
        }
    }
}
