//
//  UIView+IB.swift
//  SZParking
//
//  Created by nbfujx on 2020/7/28.
//  Copyright © 2020 ningbokubin. All rights reserved.
//

import Foundation
import UIKit

public extension UIView {
    /// 圆角
    @IBInspectable var rcornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        } set {
            layer.masksToBounds = (newValue > 0)
            layer.cornerRadius = newValue
        }
    }

    /// 边线宽度
    @IBInspectable var rborderWidth: CGFloat {
        get {
            return layer.borderWidth
        } set {
            layer.borderWidth = newValue
        }
    }

    /// 边线颜色
    @IBInspectable var rborderColor: UIColor {
        get {
            return layer.rborderUIColor
        } set {
            layer.borderColor = newValue.cgColor
        }
    }
}

extension CALayer {
    /// 设置边线颜色
    var rborderUIColor: UIColor {
        get {
            return UIColor(cgColor: borderColor!)
        } set {
            borderColor = newValue.cgColor
        }
    }
}
