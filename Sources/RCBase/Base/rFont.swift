//
//  FontConfig.swift
//  base
//
//  Created by 林小鹏 on 2021/12/7.
//

import Foundation
import UIKit

struct rFont {
    static func font(font: CGFloat) -> UIFont {
        return UIFont.systemFont(ofSize: font)
    }

    static func font(_ font: CGFloat, _ weight: UIFont.Weight) -> UIFont {
        return UIFont.systemFont(ofSize: font, weight: weight)
    }
}
