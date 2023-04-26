//
//  HomeViewModel.swift
//  snapkitDemo
//
//  Created by Sevda Gül Baran on 3.04.2023.
//

import Foundation

protocol HomeViewModelCoordinatorDelegate: AnyObject {
    func dismiss()
}

final class HomeViewModel {
    
    weak var coordinatorDelegate: (HomeViewModelCoordinatorDelegate)?
    
    func dismiss() {
        coordinatorDelegate?.dismiss()
    }
}
