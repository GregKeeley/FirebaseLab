//
//  ProfileView.swift
//  FirebaseLab
//
//  Created by Gregory Keeley on 3/4/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

class ProfileView: UIView {
    
    public lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.text = "User Name"
        return label
    }()
    public lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Number"
        return label
    }()
    public lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email Address"
        return label
    }()
    
    public lazy var userNameTextField: UITextField = {
        let label = UITextField()
        return label
    }()
    public lazy var phoneNumberTextField: UITextField = {
        let label = UITextField()
        return label
    }()
    public lazy var emailTextField: UITextField = {
        let label = UITextField()
        return label
    }()
    
    public lazy var profileImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person")
        return image
    }()
    public lazy var changeProfileButton: UIButton = {
        let button = UIButton()
        button.imageView?.image = UIImage(systemName: "pencil")
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
        
        profileImageViewConstraints()
        userNameLabelConstraints()
        phoneNumberLabelConstraints()
        emailLabelConstraints()
    
        userNameTextFieldConstraints()
        emailTextFieldConstraints()
        phoneNumberLabelConstraints()
        

        changeProfileButtonConstraints()

    }
    /*
     userNameLabel
     phoneNumberLabel
     emailLabel
     userNameTextField
     phoneNumberTextField
     emailTextField
     profileImageView
     changeProfileButton
     8
     */
    private func userNameLabelConstraints() {
        addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            
        ])
    }
    private func phoneNumberLabelConstraints() {
        addSubview(phoneNumberLabel)
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        ])
    }
    private func emailLabelConstraints() {
        addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        ])
    }
    private func userNameTextFieldConstraints() {
        addSubview(userNameTextField)
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        ])
    }
    private func phoneNumberTextFieldConstraints() {
        addSubview(phoneNumberTextField)
        phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneNumberLabel.bottomAnchor.constraint(equalTo: profileImageView.bottomAnchor),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 20),
            phoneNumberLabel.trailingAnchor.constraint(equalTo: profileImageView.leadingAnchor, constant: 10)
        ])
    }
    private func emailTextFieldConstraints() {
        addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        ])
    }
    private func profileImageViewConstraints() {
        addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: -20),
            profileImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 20),
            profileImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.30),
            profileImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.30)
        ])
    }
    private func changeProfileButtonConstraints() {
        addSubview(changeProfileButton)
        changeProfileButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            changeProfileButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            changeProfileButton.centerYAnchor.constraint(equalTo: profileImageView.centerYAnchor),
            changeProfileButton.heightAnchor.constraint(equalTo: profileImageView.widthAnchor, multiplier: 0.30),
            changeProfileButton.widthAnchor.constraint(equalTo: changeProfileButton.widthAnchor)
        ])
    }
}
