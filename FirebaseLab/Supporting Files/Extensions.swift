//
//  String+Extension.swift
//  FirebaseLab
//
//  Created by Gregory Keeley on 3/7/20.
//  Copyright © 2020 Gregory Keeley. All rights reserved.
//

import UIKit
import AVFoundation

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

extension UIViewController {
    
    private static func resetWindow(with rootviewController: UIViewController) {
        guard let scene = UIApplication.shared.connectedScenes.first,
            let sceneDelegate = scene.delegate as? SceneDelegate,
            let window = sceneDelegate.window else {
                fatalError("Could not reset window rootViewController")
        }
        window.rootViewController = rootviewController
    }
}

extension UIViewController {
    func showAlert(title: String?, message: String, completion: ((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: completion)
        alertController.addAction(okAction)
        present(alertController, animated: true, completion: nil)
    }
}
extension UIImage {
  static func resizeImage(originalImage: UIImage, rect: CGRect) -> UIImage {
    let rect = AVMakeRect(aspectRatio: originalImage.size, insideRect: rect)
    let size = CGSize(width: rect.width, height: rect.height)
    let renderer = UIGraphicsImageRenderer(size: size)
    return renderer.image { (context) in
      originalImage.draw(in: CGRect(origin: .zero, size: size))
    }
  }
}
extension UIColor {
  static func generateRandomColor() -> UIColor {
      let redValue = CGFloat.random(in: 0...1)
      let greenValue = CGFloat.random(in: 0...1)
      let blueValue = CGFloat.random(in: 0...1)
      let randomColor = UIColor(red: redValue, green: greenValue, blue: blueValue, alpha: 1.0)
      return randomColor
  }
}
@IBDesignable
class GradientView: UIView {
  @IBInspectable var cornerRadius: CGFloat = 0
  
  override func layoutSubviews() {
    super.layoutSubviews()
    layer.masksToBounds = true
    layer.cornerRadius = cornerRadius
    let gradientLayer = CAGradientLayer()
    let colors = [UIColor.generateRandomColor().cgColor, UIColor.generateRandomColor().cgColor]
    gradientLayer.frame = bounds
    gradientLayer.colors = colors
    layer.addSublayer(gradientLayer)
  }
}
