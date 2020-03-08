//
//  ViewController.swift
//  FirebaseLab
//
//  Created by Gregory Keeley on 2/28/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage

class MainViewController: UIViewController {
    
    
    
    private let mainView = MainView()
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        getFonts()
        loadUI()
    }
    override func viewWillAppear(_ animated: Bool) {
                navigationController?.setNavigationBarHidden(true, animated: animated)

    }
    override func viewWillDisappear(_ animated: Bool) {
                navigationController?.setNavigationBarHidden(false, animated: animated)

    }
    private func loadUI() {
        mainView.profileSettingsButton.addTarget(self, action: #selector(profileSettingsPressed(_:)), for: .touchUpInside)
    }
    private func getFonts() {
         let families = UIFont.familyNames
         families.sorted().forEach {
           print("\($0)")
           let names = UIFont.fontNames(forFamilyName: $0)
           print(names)
         }
    }

    @IBAction func profileSettingsPressed(_ sender: UIButton) {
        navigationController?.pushViewController(ProfileViewController(), animated: true)
    }
    
}

