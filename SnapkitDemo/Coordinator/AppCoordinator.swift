//
//  AppCoordinator.swift
//  snapkitDemo
//
//  Created by Sevda Gül Baran on 3.04.2023.
//

import UIKit

final class AppCoordinator: BaseCoordinator {
    
    // MARK: - Properties
    let window: UIWindow?
    
    lazy var rootViewController: UINavigationController = {
      return UINavigationController()
    }()
      
    init(window: UIWindow?) {
      self.window = window
    }
    
    override func start() {
        guard let window = window else { return }
        window.rootViewController = rootViewController
        window.makeKeyAndVisible()
        loginFlow()
    }
    
    private func loginFlow() {
        let loginCoordinator = LoginCoordinator(navigationController: rootViewController)
        store(coordinator: loginCoordinator)
        loginCoordinator.start()
    }
}
