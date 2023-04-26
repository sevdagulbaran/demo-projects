//
//  HomeViewController.swift
//  snapkitDemo
//
//  Created by Sevda Gül Baran on 3.04.2023.
//

import UIKit

final class HomeViewController: UIViewController {
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Back", for: .normal)
        button.addTarget(self, action: #selector(backButtonTapped), for: .touchUpInside)
        return button
    }()

    var viewModel: HomeViewModel
    
    init(viewModel: HomeViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .red
        title = "Home"
        setupViews()
    }
    
    
    private func setupViews() {
        view.addSubview(backButton)
        backButton.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-32)
            make.leading.trailing.equalToSuperview().inset(32)
        }
    }
    
    @objc private func backButtonTapped() {
        viewModel.dismiss()
    }
}
