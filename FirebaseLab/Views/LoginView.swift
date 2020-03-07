//
//  LoginView.swift
//  FirebaseLab
//
//  Created by Gregory Keeley on 3/4/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit


class LoginView: UIView {
    
    public lazy var bkgdView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
        view.layer.cornerRadius = 8
        return view
    }()
//    public lazy var iconImage: UIImageView = {
//       let image = UIImageView()
//        image.image = "💩".image()
//        image.backgroundColor = .clear
//        image.contentMode = .scaleToFill
//        image.layer.masksToBounds = true
//        image.layer.cornerRadius = image.bounds.width / 2
//        return image
//    }()
    public lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Email"
        return label
    }()
    public lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Password"
        return label
    }()
    public lazy var iconLabel: UILabel = {
       let label = UILabel()
        label.text = "💩"
        label.contentMode = .scaleAspectFit
        label.font = label.font.withSize(150)
        return label
    }()
    public lazy var emailTextField: UITextField = {
        let field = UITextField()
        field.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        field.placeholder = " Enter email address"
        return field
    }()
    public lazy var passwordTextField: UITextField = {
        let field = UITextField()
        field.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        field.placeholder = " Enter password"
        return field
    }()
    public lazy var loginButton: UIButton = {
        let button = UIButton()
        button.setTitle("Login", for: .normal)
        button.titleLabel?.textColor = .black
        button.backgroundColor = .white
        return button
    }()
    public lazy var signUpButton: UIButton = {
        let button = UIButton()
        button.setTitle("Sign Up", for: .normal)
        return button
    }()
    override init(frame: CGRect) {
        super.init(frame: UIScreen.main.bounds)
        commonInit()
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    private func commonInit() {
        bkgdViewConstraints()
        iconLabelConstraints()
        emailFieldConstraints()
        passwordFieldConstraints()
        passwordLabelConstraints()
        emailLabelConstraints()
        loginButtonConstraints()
        signUpConstraints()
    }
    
    
    private func bkgdViewConstraints() {
        addSubview(bkgdView)
        bkgdView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            bkgdView.centerYAnchor.constraint(equalTo: centerYAnchor),
            bkgdView.centerXAnchor.constraint(equalTo: centerXAnchor),
            bkgdView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.heightAnchor, multiplier: 0.80),
            bkgdView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.80)
        
        ])
    }
//    private func iconImageConstraints() {
//        addSubview(iconImage)
//        iconImage.translatesAutoresizingMaskIntoConstraints = false
//        NSLayoutConstraint.activate([
//
//            iconImage.centerXAnchor.constraint(equalTo: centerXAnchor),
//            iconImage.centerYAnchor.constraint(equalTo: bkgdView.topAnchor),
//            iconImage.widthAnchor.constraint(equalTo: bkgdView.widthAnchor, multiplier: 0.50),
//            iconImage.heightAnchor.constraint(equalTo: bkgdView.widthAnchor, multiplier: 0.50)
//
//        ])
//    }

    private func iconLabelConstraints() {
        addSubview(iconLabel)
        iconLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            iconLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconLabel.centerYAnchor.constraint(equalTo: bkgdView.topAnchor),
            iconLabel.widthAnchor.constraint(equalTo: bkgdView.widthAnchor, multiplier: 0.50),
            iconLabel.heightAnchor.constraint(equalTo: bkgdView.widthAnchor, multiplier: 0.50)
        
        ])
    }
    private func emailFieldConstraints() {
        addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            emailTextField.topAnchor.constraint(equalTo: iconLabel.bottomAnchor, constant: 60),
            emailTextField.leadingAnchor.constraint(equalTo: bkgdView.leadingAnchor, constant: 8),
            emailTextField.trailingAnchor.constraint(equalTo: bkgdView.trailingAnchor, constant: -8)
        ])
    }
    private func passwordFieldConstraints() {
        addSubview(passwordTextField)
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 40),
            passwordTextField.leadingAnchor.constraint(equalTo: bkgdView.leadingAnchor, constant: 8),
            passwordTextField.trailingAnchor.constraint(equalTo: bkgdView.trailingAnchor, constant: -8)
        
        ])
    }
    private func emailLabelConstraints() {
        addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            emailLabel.bottomAnchor.constraint(equalTo: emailTextField.topAnchor, constant: -8),
            emailLabel.leadingAnchor.constraint(equalTo: emailTextField.leadingAnchor)
        
        ])
    }
    private func passwordLabelConstraints() {
        addSubview(passwordLabel)
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
        passwordLabel.bottomAnchor.constraint(equalTo: passwordTextField.topAnchor, constant: -8),
        passwordLabel.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor)
        
        ])
    }
    private func loginButtonConstraints() {
        addSubview(loginButton)
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            loginButton.leadingAnchor.constraint(equalTo: passwordTextField.leadingAnchor)
            
        ])
    }
    private func signUpConstraints() {
        addSubview(signUpButton)
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            signUpButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 40),
            signUpButton.trailingAnchor.constraint(equalTo: passwordTextField.trailingAnchor)
            
        ])
    }
}
