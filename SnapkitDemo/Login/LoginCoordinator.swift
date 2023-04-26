//
//  LoginCoordinator.swift
//  snapkitDemo
//
//  Created by Sevda Gül Baran on 3.04.2023.
//

import UIKit

final class LoginCoordinator: BaseCoordinator, LoginViewModelDelegate, HomeViewModelCoordinatorDelegate {
    
    private let navigationController: UINavigationController
    
    private lazy var loginController: LoginViewController = {
            let viewModel = LoginViewModel()
            viewModel.delegate = self
        let viewController = LoginViewController(viewModel: viewModel)
        return viewController
    }()
    
    init(navigationController: UINavigationController) {
        self.navigationController = navigationController
    }
 
    override func start() {
          navigationController.setViewControllers([loginController], animated: true)
      }
    
    func routeToHome() {
        let viewModel = HomeViewModel()
        viewModel.coordinatorDelegate = self
        let viewController = HomeViewController(viewModel: viewModel)
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func routeToRegister() {
        let viewController = RegisterViewController()
        navigationController.pushViewController(viewController, animated: true)
    }
    
    func routeToAlert(alert: UIAlertController) {
        navigationController.present(alert, animated: true)
    }
    
    func dismiss() {
        navigationController.popViewController(animated: true)
    }
    
}

