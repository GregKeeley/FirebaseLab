//
//  LoginView.swift
//  FirebaseLab
//
//  Created by Gregory Keeley on 3/4/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit

extension String {
    func image() -> UIImage? {
        let size = CGSize(width: 40, height: 40)
        UIGraphicsBeginImageContextWithOptions(size, false, 0)
        UIColor.white.set()
        let rect = CGRect(origin: .zero, size: size)
        UIRectFill(CGRect(origin: .zero, size: size))
        (self as AnyObject).draw(in: rect, withAttributes: [.font: UIFont.systemFont(ofSize: 40)])
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
}

class LoginView: UIView {
    
    private lazy var bkgdView: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.3176470697, green: 0.07450980693, blue: 0.02745098062, alpha: 1)
        view.layer.cornerRadius = 8
        return view
    }()
    private lazy var iconImage: UIImageView = {
       let image = UIImageView()
        image.image = "💩".image()
        image.backgroundColor = #colorLiteral(red: 0.9568627477, green: 0.6588235497, blue: 0.5450980663, alpha: 1)
        image.contentMode = .scaleToFill
        image.layer.masksToBounds = true
        image.layer.cornerRadius = image.bounds.width / 2
        return image
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
        iconImageConstraints()
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
    private func iconImageConstraints() {
        addSubview(iconImage)
        iconImage.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
        
            iconImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            iconImage.centerYAnchor.constraint(equalTo: bkgdView.topAnchor),
            iconImage.widthAnchor.constraint(equalTo: bkgdView.widthAnchor, multiplier: 0.50),
            iconImage.heightAnchor.constraint(equalTo: bkgdView.widthAnchor, multiplier: 0.50)
        
        ])
    }
}
