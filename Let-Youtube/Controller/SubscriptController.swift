//
//  SubscriptController.swift
//  Let-Youtube
//
//  Created by 이운형 on 2019/11/17.
//  Copyright © 2019 201302458. All rights reserved.
//

import UIKit

class SubscriptController: HomeController {

    override func fetchVideos() {
        ApiService.shared.fetchVideo(with: URLInfo.subscriptionURL, completion: {
            videos in
            
            self.videos = videos
            self.collectionView.reloadData()
        })
    }
}
