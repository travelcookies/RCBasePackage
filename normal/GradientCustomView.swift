//
//  GradientCustomView.swift
//  SZParking
//
//  Created by 林小鹏 on 2022/10/9.
//  Copyright © 2022 ningbokubin. All rights reserved.
//

import Foundation
 import UIKit
 
class GradientCustomView: UIView {
    
    @IBInspectable var isGradient: Bool = false
    @IBInspectable var startColor: UIColor = .white
    @IBInspectable var endColor: UIColor = .white
    @IBInspectable var locations: [NSNumber] = [0 , 1]
    @IBInspectable var startPoint: CGPoint = .zero
    @IBInspectable var endPoint: CGPoint = .zero
    
    private var gradientBGLayer: CAGradientLayer?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientBGLayer?.removeFromSuperlayer()
        if isGradient {
            gradientBGLayer = CAGradientLayer()
            gradientBGLayer!.colors = [startColor.cgColor, endColor.cgColor]
            gradientBGLayer!.locations = locations
            gradientBGLayer!.frame = bounds
            gradientBGLayer!.startPoint = startPoint
            gradientBGLayer!.endPoint = endPoint
            self.layer.insertSublayer(gradientBGLayer!, at: 0)
        }
    }
 
}
 
class GradientCustomButton: UIButton {
    
    @IBInspectable var isGradient: Bool = false
    @IBInspectable var startColor: UIColor = .white
    @IBInspectable var endColor: UIColor = .white
    @IBInspectable var locations: [NSNumber] = [0 , 1]
    @IBInspectable var startPoint: CGPoint = .zero
    @IBInspectable var endPoint: CGPoint = .zero
    
    private var gradientBGLayer: CAGradientLayer?
    
    override func layoutSubviews() {
        super.layoutSubviews()
        gradientBGLayer?.removeFromSuperlayer()
        if isGradient {
            gradientBGLayer = CAGradientLayer()
            gradientBGLayer!.colors = [startColor.cgColor, endColor.cgColor]
            gradientBGLayer!.locations = locations
            gradientBGLayer!.frame = bounds
            gradientBGLayer!.startPoint = startPoint
            gradientBGLayer!.endPoint = endPoint
            self.layer.insertSublayer(gradientBGLayer!, at: 0)
        }
    }
    
}
