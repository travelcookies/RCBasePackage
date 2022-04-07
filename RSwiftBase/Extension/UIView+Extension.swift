//
//  UIView+Extension.swift
//  SZParking
//
//  Created by nbfujx on 2020/8/26.
//  Copyright © 2020 ningbokubin. All rights reserved.
//

import Foundation
import UIKit
public extension UIView {
    /**
     添加圆角 某个方向
     topLeft
     topRight
     bottomLeft
     bottomRight
     allCorners */
    func addCorner(conrners: UIRectCorner, radius: CGFloat) {
        let maskPath = UIBezierPath(roundedRect: bounds, byRoundingCorners: conrners, cornerRadii: CGSize(width: radius, height: radius))
        let maskLayer = CAShapeLayer()
        maskLayer.frame = bounds
        maskLayer.path = maskPath.cgPath
        layer.mask = maskLayer
    }
}
