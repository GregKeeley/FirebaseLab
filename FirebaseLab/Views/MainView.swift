//
//  MainView.swift
//  FirebaseLab
//
//  Created by Gregory Keeley on 3/4/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

class MainView: UIView {
    
    public lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.text = "Welcome!"
        label.font = UIFont.preferredFont(forTextStyle: .headline)
        label.adjustsFontForContentSizeCategory = true
        label.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.textColor = .black
        return label
    }()
    public lazy var userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.preferredFont(forTextStyle: .largeTitle)
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.adjustsFontForContentSizeCategory = true
        label.text = "UserName"
        return label
    }()
    public lazy var phoneNumberLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.adjustsFontForContentSizeCategory = true
        label.text = "(555)-555-5555"
        return label
    }()
    public lazy var emailLabel: UILabel = {
        let label = UILabel()
        label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        label.font = UIFont.preferredFont(forTextStyle: .caption1)
        label.adjustsFontForContentSizeCategory = true
        label.text = "email@theInternet.com"
        return label
    }()
    public lazy var profileImageView: UIImageView = {
        let image = UIImageView()
        image.image = UIImage(systemName: "person.fill")
        image.layer.cornerRadius = 20
        return image
    }()
    public lazy var profileSettingsButton: UIButton = {
        let button = UIButton()
        button.setTitle("Profile Settings", for: .normal)
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
        greetingLabelConstraint()
        userNameLabelConstraint()
        phoneLabelConstraint()
        emailLabelConstraint()
        profileImageConstraint()
        profileSettingsButtonConstraint()
    }
    private func greetingLabelConstraint() {
       addSubview(greetingLabel)
        greetingLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            greetingLabel.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            greetingLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8)
        
        ])
    }
    private func userNameLabelConstraint() {
       addSubview(userNameLabel)
        userNameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            userNameLabel.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 20),
            userNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
            
        ])
    }
    private func phoneLabelConstraint() {
       addSubview(phoneNumberLabel)
        phoneNumberLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            phoneNumberLabel.topAnchor.constraint(equalTo: userNameLabel.bottomAnchor, constant: 10),
            phoneNumberLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
            
        ])
    }
    private func emailLabelConstraint() {
       addSubview(emailLabel)
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            emailLabel.topAnchor.constraint(equalTo: phoneNumberLabel.bottomAnchor, constant: 10),
            emailLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 10)
            
        ])
    }
    private func profileImageConstraint() {
       addSubview(profileImageView)
        profileImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            profileImageView.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 40),
            profileImageView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            profileImageView.widthAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.30),
            profileImageView.heightAnchor.constraint(equalTo: safeAreaLayoutGuide.widthAnchor, multiplier: 0.30)
        
        ])
    }
    private func profileSettingsButtonConstraint() {
       addSubview(profileSettingsButton)
        profileSettingsButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            profileSettingsButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            profileSettingsButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -10)
            
        ])
    }
}
