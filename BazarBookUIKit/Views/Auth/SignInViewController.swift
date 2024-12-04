//
//  SignInViewController.swift
//  BazarBookUIKit
//
//  Created by yanuar nauval ardian on 11/10/24.
//

import UIKit



class SignInViewController: UIViewController {
    private let titleLabel = UILabel()
    private let subtitleLabel = UILabel()
    private let emailLabel = UILabel()
    private let passwordLabel = UILabel()
    private let emailTextField = BazarTextField()
    private var passwordTextField = BazarTextField()
    private let forgotPasswordButton = UILabel()
    private let loginButton = PrimaryButton()
    private let scrollView = UIScrollView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()
    }
    
}


extension SignInViewController {
    func setup(){
        [titleLabel,subtitleLabel,emailLabel,emailTextField,passwordLabel,passwordTextField,forgotPasswordButton,loginButton].forEach{ item in
            scrollView.addSubview(item)
        }
        view.addSubview(scrollView)
    }
    
    func style(){
        titleLabel.text = "Welcome Back 👋"
        titleLabel.font = .largeTitle
        
        subtitleLabel.text = "Sign to your account"
        subtitleLabel.font = .body
        subtitleLabel.textColor = UIColor(named: "textSecondary")
        
        emailLabel.text = "Email"
        emailLabel.font = .body
        
        passwordLabel.text = "Password"
        passwordLabel.font = .body
        
        emailTextField.placeholder = "Your email"
        passwordTextField.placeholder = "Your password"
        
        loginButton.configuration(title: "Login")
        
        forgotPasswordButton.text = "Forgot password?"
        forgotPasswordButton.font = .body
        forgotPasswordButton.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(forgotPasswordTapped)))
        
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        [titleLabel, subtitleLabel, emailLabel, emailTextField, passwordLabel, passwordTextField, forgotPasswordButton, loginButton].forEach {
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
    func layout(){
        
        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor,constant: 16),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor,constant: -16),
        ])
        
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: scrollView.topAnchor),
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor,constant: 16),
            // email section
            emailLabel.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor,constant: 30),
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor),
            emailTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            // password section
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 30),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor),
            passwordTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 20),
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor,constant: 30),
            loginButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor)
        ])
    }
}

extension SignInViewController {
    @objc func forgotPasswordTapped() {
        print("Clicked forgot password")
    }
}

#Preview {
    SignInViewController()
}
