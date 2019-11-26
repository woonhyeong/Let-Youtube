//
//  Setting.swift
//  Let-Youtube
//
//  Created by 이운형 on 2019/11/17.
//  Copyright © 2019 201302458. All rights reserved.
//

import UIKit

class Setting: NSObject {
    let name: SettingMode
    let imageName: String
    
    init(name: SettingMode, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

enum SettingMode: String {
    case Settings = "Settings"
    case TermAndPrivacy = "Terms & privacy plicy"
    case SendFeedback = "Send Feedback"
    case Help = "Help"
    case SwitchAccount = "Switch Account"
    case Cancel = "Cancel"
    case myChannel = "내 채널"
    case watchingTime = "시청 시간"
    case premiumEnroll = "YouTube Premium 가입"
    case payMembership = "유료 멤버쉽"
    case convertAccount = "계정 전환"
    case useSecretMode = "시크릿 모드 사용"
    case userSetting = "설정"
    case userRequest = "고객센터"
}
