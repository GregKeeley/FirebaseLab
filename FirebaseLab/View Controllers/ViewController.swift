//
//  ViewController.swift
//  FirebaseLab
//
//  Created by Gregory Keeley on 2/28/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    
    
    
    private let mainView = MainView()
    override func loadView() {
        view = mainView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3333333433, green: 0.3333333433, blue: 0.3333333433, alpha: 1)
        getFonts()
        loadUI()
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

