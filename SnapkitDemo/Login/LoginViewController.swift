
import UIKit
import SnapKit

final class LoginViewController: UIViewController {
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Email"
        textField.borderStyle = .roundedRect
        textField.autocorrectionType = .no
        textField.autocapitalizationType = .none
        textField.keyboardType = .emailAddress
        return textField
    }()
    
    private lazy var passwordTextField: UITextField = {
        let textField = UITextField()
        textField.placeholder = "Password"
        textField.borderStyle = .roundedRect
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Login", for: .normal)
        button.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var registerButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Register", for: .normal)
        button.addTarget(self, action: #selector(registerButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton,registerButton])
        stackView.axis = .vertical
        stackView.spacing = 16
        return stackView
    }()
    
    var viewModel: LoginViewModelProtocol
    
    init(viewModel: LoginViewModelProtocol) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "Login"
        setupViews()
    }
    
    private func setupViews() {
        view.addSubview(stackView)
        stackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview().offset(-32)
            make.leading.trailing.equalToSuperview().inset(32)
        }
    }
    @objc private func registerButtonTapped() {
        viewModel.routeToRegister()
    }
    @objc private func loginButtonTapped() {
        viewModel.login(email: emailTextField.text, password: passwordTextField.text) { [weak self] success in
            guard let self = self else { return }
            if success {
                viewModel.routeToHome()
            } else {
                let alert = UIAlertController(title: "Hata", message: "Geçersiz e-posta veya şifre", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Tamam", style: .default))
                viewModel.routeToAlert(alert: alert)
            }
        }
    }
}
