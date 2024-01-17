//
//  Configs.swift
//  RSwiftBase
//
//  Created by 林小鹏 on 2023/12/8.
//

import Foundation

struct Configs {
    struct App {
        static let testUrl = "https://github.com/khoren93/SwiftHub"
    }

    struct Network {
        static let test1 = false
        static let test2 = "https://api.github.com"
    }

    /// 基础规模
    struct BaseDimensions {
        static let inset: CGFloat = 8
        static let tabBarHeight: CGFloat = 58
        static let toolBarHeight: CGFloat = 66
        static let navBarWithStatusBarHeight: CGFloat = 64
        static let cornerRadius: CGFloat = 5
        static let borderWidth: CGFloat = 1
        static let buttonHeight: CGFloat = 40
        static let textFieldHeight: CGFloat = 40
        static let tableRowHeight: CGFloat = 36
        static let segmentedControlHeight: CGFloat = 40
    }

    /// 路径
    struct Path {
        static let Documents = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]
        static let Tmp = NSTemporaryDirectory()
    }

    /// 默认秘钥名
    struct UserDefaultsKeys {
        static let bannersEnabled = "BannersEnabled"
    }

    // All keys are demonstrative and used for the test.
    enum Keys {
        case github, mixpanel, adMob

        var apiKey: String {
            switch self {
            case .github: return "5a39979251c0452a9476bd45c82a14d8e98c3fb3"
            case .mixpanel: return "7e428bc407e3612f6d3a4c8f50fd4643"
            case .adMob: return "ca-app-pub-3940256099942544/2934735716"
            }
        }

        var appId: String {
            switch self {
            case .github: return "00cbdbffb01ec72e280a"
            case .mixpanel: return ""
            case .adMob: return "" // See GADApplicationIdentifier in Info.plist
            }
        }
    }
}
