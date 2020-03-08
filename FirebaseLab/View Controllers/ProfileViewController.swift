//
//  ProfileViewController.swift
//  FirebaseLab
//
//  Created by Gregory Keeley on 3/4/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

    private var settingsView = ProfileView()
    override func loadView() {
        view = settingsView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        setupUI()
    }
    private func setupUI() {
        settingsView.changePhotoButton.addTarget(self, action: #selector(editPhotoButtonPressed(_:)), for: .touchUpInside)
    }
    @IBAction func editPhotoButtonPressed(_ sender: UIButton) {
        print("photo change")
    }
    
}
