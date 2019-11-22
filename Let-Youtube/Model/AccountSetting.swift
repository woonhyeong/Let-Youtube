//
//  UserSetting.swift
//  Let-Youtube
//
//  Created by 이운형 on 2019/11/22.
//  Copyright © 2019 201302458. All rights reserved.
//

import UIKit

class AccountSetting: NSObject {
    let name: AccountSettingMode
    let imageName: String
    
    init(name: AccountSettingMode, imageName: String) {
        self.name = name
        self.imageName = imageName
    }
}

enum AccountSettingMode: String {
    case myChannel = "내 채널"
    case watchingTime = "시청 시간"
    case premiumEnroll = "YouTube Premium 가입"
    case payMembership = "유료 멤버쉽"
    case convertAccount = "계정 전환"
    case useSecretMode = "시크릿 모드 사용"
}
