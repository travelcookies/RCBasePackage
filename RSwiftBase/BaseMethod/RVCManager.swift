//
//  SZGetViewController.swift
//  SZParking
//
//  Created by 林小鹏 on 2022/10/18.
//  Copyright © 2022 ningbokubin. All rights reserved.
//

import Foundation
import UIKit

class RVCManager {
    public class func getCurrentVC() -> UIViewController {
        let rootVc = UIApplication.shared.keyWindow?.rootViewController
        let currentVc = getCurrentVcFrom(rootVc!)
        return currentVc
    }

    private class func getCurrentVcFrom(_ rootVc: UIViewController) -> UIViewController {
        var currentVc: UIViewController
        var rootCtr = rootVc
        if rootCtr.presentedViewController != nil {
            rootCtr = rootVc.presentedViewController!
        }
        if rootVc.isKind(of: UITabBarController.classForCoder()) {
            currentVc = getCurrentVcFrom((rootVc as! UITabBarController).selectedViewController!)
        } else if rootVc.isKind(of: UINavigationController.classForCoder()) {
            currentVc = getCurrentVcFrom((rootVc as! UINavigationController).visibleViewController!)
        } else {
            currentVc = rootCtr
        }
        return currentVc
    }
}
