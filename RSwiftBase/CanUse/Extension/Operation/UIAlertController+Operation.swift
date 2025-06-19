//
//  UIAlertController+Operation.swift
//  RSwiftBase
//
//  Created by 林小鹏 on 2025/6/19.
//

import Foundation
import UIKit

extension UIAlertController {
    class func reconfimAlertView(title: String?, message: String?, confirm: @escaping () -> Void) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: localizable("cancel"), style: .cancel, handler: nil))
        alert.addAction(UIAlertAction(title: localizable("ok"), style: .default) { _ in
            confirm()
        })
        return alert
    }

    class func singleAlertView(title: String?, message: String?, confirm: @escaping () -> Void) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: localizable("ok"), style: .default) { _ in
            confirm()
        })
        return alert
    }
}

func localizable(_ key: String) -> String {
    return NSLocalizedString(key, comment: "")
}
