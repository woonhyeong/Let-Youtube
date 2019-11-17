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
}
