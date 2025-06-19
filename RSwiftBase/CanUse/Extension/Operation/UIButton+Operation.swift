//
//  UIButton+Operation.swift
//  RSwiftBase
//
//  Created by 林小鹏 on 2025/6/19.
//


public extension UIButton {
    /// 设置背景
    /// - Parameters:
    ///   - imageName: 图片名称
    ///   - bgImageName: 背景图片名称 可不填写
    convenience init(imageName: String, _ bgImageName: String? = nil) {
        self.init()
        setImage(UIImage(named: imageName), for: .normal)
        setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)

        if let bgImageName1 = bgImageName {
            setBackgroundImage(UIImage(named: bgImageName1), for: .normal)
            setBackgroundImage(UIImage(named: bgImageName1 + "_highlighted"), for: .highlighted)
        }

        sizeToFit()
    }
}

