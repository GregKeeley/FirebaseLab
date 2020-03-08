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
        label.textColor = .white
        return label
    }()
    public lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.text = "Phone Number"
        label.textColor = .white
        return label
    }()
    public lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.text = "Email Address"
        label.textColor = .white
        return label
    }()
    
    public lazy var userNameTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = " User Name"
        return textField
    }()
    public lazy var phoneNumberTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = " Phone Number"
        return textField
    }()
    public lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.backgroundColor = .white
        textField.placeholder = " Email Address"
        return textField
    }()
    
    public lazy var profileImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person")
        return image
    }()
    public lazy var changePhotoButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "pencil"), for: .normal)
        button.tintColor = .blue
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
        changeProfileButtonConstraints()

        userNameLabelConstraints()
        userNameTextFieldConstraints()
        phoneNumberLabelConstraints()
        phoneNumberTextFieldConstraints()
        emailLabelConstraints()
        emailTextFieldConstraints()
        ()
        


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
    private var leadAnchorStd: CGFloat = 20
    private var fieldWidthFactor: CGFloat = 0.50
    private func userNameLabelConstraints() {
        addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadAnchorStd),
            userNameLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60)
        ])
    }
    private func userNameTextFieldConstraints() {
        addSubview(userNameTextField)
        userNameTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            userNameTextField.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10),
            userNameTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadAnchorStd),
            userNameTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: fieldWidthFactor)
        ])
    }
    private func phoneNumberLabelConstraints() {
        addSubview(phoneNumberLabel)
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            phoneNumberLabel.topAnchor.constraint(equalTo: userNameTextField.bottomAnchor, constant: 20),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadAnchorStd)
        ])
    }
       private func phoneNumberTextFieldConstraints() {
            addSubview(phoneNumberTextField)
            phoneNumberTextField.translatesAutoresizingMaskIntoConstraints = false
            NSLayoutConstraint.activate([
                phoneNumberTextField.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 10),
                phoneNumberTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadAnchorStd),
                phoneNumberTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: fieldWidthFactor)
            ])
        }
    private func emailLabelConstraints() {
        addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: phoneNumberTextField.bottomAnchor, constant: 20),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadAnchorStd),
            
        ])
    }
    private func emailTextFieldConstraints() {
        addSubview(emailTextField)
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 10),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: leadAnchorStd),
            emailTextField.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: fieldWidthFactor)
        ])
    }
    private func profileImageViewConstraints() {
        addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            profileImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 60),
            profileImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            profileImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.30),
            profileImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.30)
        ])
    }
    private func changeProfileButtonConstraints() {
        addSubview(changePhotoButton)
        changePhotoButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([

            changePhotoButton.topAnchor.constraint(equalTo: profileImageView.bottomAnchor, constant: 10),
            changePhotoButton.centerXAnchor.constraint(equalTo: profileImageView.centerXAnchor),
            changePhotoButton.heightAnchor.constraint(equalTo: profileImageView.widthAnchor, multiplier: 0.5),
            changePhotoButton.widthAnchor.constraint(equalTo: profileImageView.widthAnchor, multiplier: 0.5)
        ])
    }
}
