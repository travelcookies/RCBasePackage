//
//  UIButton+IBExtension.swift
//  SZParking
//
//  Created by nbfujx on 2020/10/22.
//  Copyright © 2020 ningbokubin. All rights reserved.
//

import Foundation
import UIKit
extension UIButton {
    //  高亮
    @IBInspectable var highlightColor: UIColor {
        get {
            return self.highlightColor
        } set {
            alpha = 0.3
            setBackgroundImage(imageWithColor(color: newValue), for: .highlighted)
        }
    }

    func imageWithColor(color: UIColor) -> UIImage {
        let rect: CGRect = CGRect(x: 0, y: 0, width: 1, height: 1)
        UIGraphicsBeginImageContext(rect.size)
        let context: CGContext = UIGraphicsGetCurrentContext()!
        context.setFillColor(color.cgColor)
        context.fill(rect)
        let image = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsGetCurrentContext()
        return image!
    }
}
