//
//  LoginViewModel.swift
//  snapkitDemo
//
//  Created by Sevda Gül Baran on 3.04.2023.
//

import UIKit

protocol LoginViewModelProtocol {
    var delegate: LoginViewModelDelegate? { get set }
    
    func routeToHome()
    func routeToRegister()
    func routeToAlert(alert: UIAlertController)
    func login(email: String?, password: String?, completion: (Bool) -> Void)
}

protocol LoginViewModelDelegate: AnyObject {
    func routeToHome()
    func routeToRegister()
    func routeToAlert(alert: UIAlertController)
}

final class LoginViewModel: LoginViewModelProtocol {
    
    // MARK: - Properties
    
    weak var delegate: LoginViewModelDelegate?
    
    // MARK: - Public Methods
    
    func routeToHome() {
        delegate?.routeToHome()
    }
    func routeToRegister() {
        delegate?.routeToRegister()
    }
    func routeToAlert(alert: UIAlertController) {
        delegate?.routeToAlert(alert: alert)
    }
    
    func login(email: String?, password: String?, completion: (Bool) -> Void) {
        // Perform login logic here, call completion block with success value
        let success = email == "test" && password == "test"
        completion(success)
    }
}
