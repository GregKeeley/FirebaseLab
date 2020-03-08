//
//  ProfileViewController.swift
//  FirebaseLab
//
//  Created by Gregory Keeley on 3/4/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseStorage
import Kingfisher

class ProfileViewController: UIViewController {

    private let storageService = StorageService()
    private var selectedImage: UIImage? {
        didSet {
            settingsView.profileImageView.image = selectedImage
        }
    }
    private lazy var imagePickerController: UIImagePickerController = {
        let ip = UIImagePickerController()
        ip.delegate = self
        return ip
    }()
    private var settingsView = ProfileView()
    override func loadView() {
        view = settingsView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = #colorLiteral(red: 0.3098039329, green: 0.01568627544, blue: 0.1294117719, alpha: 1)
        setupUI()
        updateUI()
    }
    private func updateUI() {
        guard let user = Auth.auth().currentUser else {
            return
        }
        settingsView.emailTextField.placeholder = user.email
        settingsView.phoneNumberTextField.placeholder = user.phoneNumber
        settingsView.userNameTextField.placeholder = user.displayName
    }
    private func setupUI() {
        settingsView.changePhotoButton.addTarget(self, action: #selector(editPhotoButtonPressed(_:)), for: .touchUpInside)
        settingsView.emailTextField.delegate = self
        settingsView.phoneNumberTextField.delegate = self
        settingsView.userNameTextField.delegate = self
        settingsView.changePhotoButton.addTarget(self, action: #selector(editProfilePhotoButtonPressed(_:)), for: .touchUpInside)
    }
    
    @IBAction func editPhotoButtonPressed(_ sender: UIButton) {
        print("photo change")
    }
    @IBAction func editProfilePhotoButtonPressed(_ sender: UIButton) {
        let alertController = UIAlertController(title: "Choose Photo Option", message: nil, preferredStyle: .actionSheet)
        let cameraAction = UIAlertAction(title: "Camera", style: .default) { alertAction in
            self.imagePickerController.sourceType = .camera
            self.present(self.imagePickerController, animated: true)
        }
        let photoLibraryAction = UIAlertAction(title: "Photo Library", style: .default) { alertAction in
            self.imagePickerController.sourceType = .photoLibrary
            self.present(self.imagePickerController, animated: true)
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel) { alertAction in
            self.imagePickerController.sourceType = .camera
            self.present(self.imagePickerController, animated: true)
        }
        if UIImagePickerController.isSourceTypeAvailable(.camera) {
           alertController.addAction(cameraAction)
        }
        alertController.addAction(photoLibraryAction)
        alertController.addAction(cancelAction)
        present(alertController, animated: true)
    }
    @IBAction func updateProfileButtonPressed(_ sender: UIButton) {
        guard let displayName = settingsView.userNameTextField.text,
            !displayName.isEmpty,
            let phoneNumber = settingsView.phoneNumberTextField.text,
            !phoneNumber.isEmpty,
            let email = settingsView.emailTextField.text,
            !email.isEmpty,
            let selectedImage = selectedImage else {
                showAlert(title: "Missisng Fields", message: "Please fill out every field")
                return
        }
        guard let user = Auth.auth().currentUser else { return }
        let resizedImage = UIImage.resizeImage(originalImage: selectedImage, rect: settingsView.profileImageView.bounds)
        storageService.uploadPhoto(userId: user.uid, image: resizedImage) { [weak self] (result) in
            switch result {
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.showAlert(title: "Error uploading profile photo", message: "\(error.localizedDescription)")
                }
            case .success(let url):
                let request = Auth.auth().currentUser?.createProfileChangeRequest()
                request?.displayName = displayName
                request?.photoURL = url
                request?.commitChanges(completion: { [weak self] (error) in
                    if let error = error {
                        DispatchQueue.main.async {
                            self?.showAlert(title: "There was an error saving your profile", message: "Please try again later(error: \(error.localizedDescription)")
                        }
                    }
                })
            }
        }
    }
}
extension ProfileViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage else {
            return
        }
        selectedImage = image
        dismiss(animated: true)
    }
}
extension ProfileViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
    }
}
