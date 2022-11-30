//
//  TextFieldExtension.swift
//  RSwiftBase
//
//  Created by 林小鹏 on 2022/11/30.
//


import UIKit

public extension XP where Base == UITextField {
    
    /// 设置左边空
    func setTextFieldNormalLeftV(size: CGSize = CGSize(width: 20, height: 30)) {
        let leftV = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: 35))
        base.leftView = leftV
        base.leftViewMode = .always
    }
}
