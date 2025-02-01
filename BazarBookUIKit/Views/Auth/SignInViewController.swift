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
    private let togglePasswordButton = UIButton(type: .custom)
    private let togglePasswordContainer = UIView()
    private let forgotPasswordButton = UILabel()
    private let loginButton = PrimaryButton()
    private let scrollView = UIScrollView()
    private  let dontHaveAccountSignUPLabel = UILabel()
    private let diver1 = UIView()
    private let diver2 = UIView()
    private let orWith = UILabel()
    private var googleSignInButton = SosialMediaButton()
    private var appleSignInButton = SosialMediaButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        style()
        layout()
    }
    
}


extension SignInViewController {
    func setup(){
        // additional setup
        togglePasswordContainer.addSubview(togglePasswordButton)
        
        [titleLabel,subtitleLabel,emailLabel,emailTextField,passwordLabel,passwordTextField,forgotPasswordButton,loginButton,dontHaveAccountSignUPLabel,diver1,diver2,orWith,googleSignInButton,appleSignInButton,togglePasswordContainer].forEach{ item in
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
        emailLabel.font = .bodyBold
        
        passwordLabel.text = "Password"
        passwordLabel.font = .bodyBold
        
        emailTextField.placeholder = "Your email"
        togglePasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        togglePasswordButton.tintColor = .textSecondary
        togglePasswordButton.addTarget(self, action: #selector(togglePasswordVisibility), for: .touchUpInside)
        passwordTextField.isSecureTextEntry = true
        passwordTextField.placeholder = "Your password"
        passwordTextField.rightView = togglePasswordContainer
        passwordTextField.rightViewMode = .always
        
        loginButton.configuration(title: "Login")
    
        forgotPasswordButton.text = "Forgot password?"
        forgotPasswordButton.font = .bodyBold
        forgotPasswordButton.textColor = .primary
        forgotPasswordButton.addGestureRecognizer(UIGestureRecognizer(target: self, action: #selector(forgotPasswordTapped)))
        
        
        let string = "Don’t have an account? Sign Up"
        let attributedString = NSMutableAttributedString(string: string)
        attributedString.addAttribute(.foregroundColor, value: UIColor.primary, range: NSRange(location: 23, length: 7))
        attributedString.addAttribute(.font, value: UIFont.body, range: NSRange(location: 0, length: 30))
        dontHaveAccountSignUPLabel.textColor = .textSecondary
        dontHaveAccountSignUPLabel.attributedText = attributedString
        
        
        diver1.backgroundColor = .textSecondary
        diver2.backgroundColor = .textSecondary
        orWith.text = "Or With"
        orWith.textColor = .textSecondary
        
        
        googleSignInButton.googleSignIn()
        appleSignInButton.appleSignIn()
        
        
        // set all UI to translatesAutoresizingMaskIntoConstraints = false
        [scrollView,titleLabel, subtitleLabel, emailLabel, emailTextField, passwordLabel, passwordTextField, forgotPasswordButton, loginButton,dontHaveAccountSignUPLabel,diver1,diver2,orWith,googleSignInButton,appleSignInButton,togglePasswordButton,togglePasswordContainer].forEach {
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
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor,constant: 10),
            emailTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            // password section
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor,constant: 30),
            togglePasswordContainer.topAnchor.constraint(equalTo: passwordTextField.topAnchor),
            togglePasswordContainer.bottomAnchor.constraint(equalTo: passwordTextField.bottomAnchor),
            togglePasswordContainer.widthAnchor.constraint(equalToConstant: 54),
            togglePasswordButton.centerYAnchor.constraint(equalTo: togglePasswordContainer.centerYAnchor),
            togglePasswordButton.centerXAnchor.constraint(equalTo: togglePasswordContainer.centerXAnchor),
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor,constant: 10),
            passwordTextField.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 20),
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor,constant: 30),
            loginButton.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            dontHaveAccountSignUPLabel.topAnchor.constraint(equalTo: loginButton.bottomAnchor,constant: 20),
            dontHaveAccountSignUPLabel.centerXAnchor.constraint(equalTo: scrollView.centerXAnchor),
            
        ])
        
        // for "or with " widget
        NSLayoutConstraint.activate([
            // Left line constraints
            diver1.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            diver1.trailingAnchor.constraint(equalTo: orWith.leadingAnchor, constant: -8),
            diver1.centerYAnchor.constraint(equalTo: orWith.centerYAnchor),
            diver1.heightAnchor.constraint(equalToConstant: 1),
            
            // Label constraints
            orWith.topAnchor.constraint(equalTo: dontHaveAccountSignUPLabel.bottomAnchor,constant: 30),
            orWith.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // Right line constraints
            diver2.leadingAnchor.constraint(equalTo: orWith.trailingAnchor, constant: 8),
            diver2.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            diver2.centerYAnchor.constraint(equalTo: orWith.centerYAnchor),
            diver2.heightAnchor.constraint(equalToConstant: 1),
            
            //google button
            googleSignInButton.topAnchor.constraint(equalTo: orWith.bottomAnchor,constant: 30),
            googleSignInButton.widthAnchor.constraint(equalTo:scrollView.widthAnchor),
            
            appleSignInButton.topAnchor.constraint(equalTo: googleSignInButton.bottomAnchor,constant: 10),
            appleSignInButton.widthAnchor.constraint(equalTo:scrollView.widthAnchor),
            
            
        ])
    }
}

extension SignInViewController {
    @objc func forgotPasswordTapped() {
        print("Clicked forgot password")
    }
    
    @objc func togglePasswordVisibility() {
        
        passwordTextField.isSecureTextEntry.toggle()
        
        // Update the button icon based on the secure text entry state
        let imageName = passwordTextField.isSecureTextEntry ? "eye.slash":"eye"
        togglePasswordButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
}

#Preview {
    SignInViewController()
}
