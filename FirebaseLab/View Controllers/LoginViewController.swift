//
//  LoginViewController.swift
//  FirebaseLab
//
//  Created by Gregory Keeley on 3/4/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

enum Accountstate {
    case existingUser
    case newUser
}

class LoginViewController: UIViewController {

    private var accountState: Accountstate = .existingUser
    private var authSession = AuthenticationSession()
    
    private let loginView = LoginView()
    override func loadView() {
        view = loginView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.2392156869, green: 0.6745098233, blue: 0.9686274529, alpha: 1)
        configureUI()
    }
    private func configureUI() {
        loginView.iconLabel.contentMode = .center
        loginView.iconLabel.backgroundColor = .clear
        loginView.iconLabel.layer.cornerRadius = 20
        
        loginView.loginButton.addTarget(self, action: #selector(loginButtonPressed(_:)), for: .touchUpInside)
        loginView.signUpButton.addTarget(self, action: #selector(toggleAccountState(_:)), for: .touchUpInside)
    }
    
    private func navigateToMainView() {
        present(MainViewController(), animated: true)
    }
    private func continueLoginFlow(email: String, password: String) {
        if accountState == .existingUser {
            authSession.signInExistingUser(email: email, password: password) { [weak self] (result) in
                switch result {
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.showAlert(title: "Something went wrong", message: "\(error.localizedDescription)")
                    }
                case .success:
                    print("Signed in")
                    DispatchQueue.main.async {
                        self?.navigateToMainView()
                    }
                }
            }
            
        } else {
            authSession.createNewUser(email: email, password: password) { [weak self] (result) in
                switch result {
                case .failure(let error):
                    DispatchQueue.main.async {
                        self?.showAlert(title: "Something went wrong", message: "\(error.localizedDescription)")
                    }
                case .success:
                    DispatchQueue.main.async {
                        self?.navigateToMainView()
                    }
                }
            }
        }
    }
    @IBAction func loginButtonPressed(_ sender: UIButton) {
        guard let email = loginView.emailTextField.text,
            !email.isEmpty,
            let password = loginView.passwordTextField.text,
            !password.isEmpty else {
                showAlert(title: "Missing Fields", message: "Both Email and Password is required")
                return
        }
        continueLoginFlow(email: email, password: password)
    }
    @IBAction func toggleAccountState(_ sender: UIButton) {
        accountState = accountState == .existingUser ? .newUser : .existingUser
        let duration: TimeInterval = 1.0
        if accountState == .existingUser {
            print("Existing User")
        } else {
            print("New user")
        }
    }
}
