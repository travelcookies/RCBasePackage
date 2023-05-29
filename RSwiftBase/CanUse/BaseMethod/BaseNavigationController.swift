//
//  BaseNavigationController.swift
//  RSwiftBase
//
//  Created by 林小鹏 on 2022/8/8.
//  基础NavigationController

import Foundation
import UIKit

public class BaseNavigationController: UINavigationController {
    override public func viewDidLoad() {
        super.viewDidLoad()
    }

    override public func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if children.count > 0 {
            viewController.hidesBottomBarWhenPushed = true
            if children.count > 1 {
                viewController.hidesBottomBarWhenPushed = false
            }
        }
        super.pushViewController(viewController, animated: true)
    }
}
