//
//  Video.swift
//  Let-Youtube
//
//  Created by 이운형 on 2019/11/17.
//  Copyright © 2019 201302458. All rights reserved.
//

import UIKit

struct Video: Codable {
    let title: String
    let numberOfViews: Int
    let thumbnailImageName: String
    let channel: Channel
    let duration: Int
    
    enum CodingKeys: String, CodingKey {
        case title, channel, duration
        case numberOfViews = "number_of_views"
        case thumbnailImageName = "thumbnail_image_name"
    }
}

struct Channel: Codable {
    let name: String
    let profileImageName: String
    
    enum CodingKeys: String, CodingKey {
        case name
        case profileImageName = "profile_image_name"
    }
}
