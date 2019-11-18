//
//  HomeController.swift
//  Let-Youtube
//
//  Created by 이운형 on 2019/11/17.
//  Copyright © 2019 201302458. All rights reserved.
//

import UIKit

class HomeController: UIViewController {
    
    private struct Constant {
        static let cellId = "videoCell"
    }

    // MARK: - Variables
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.backgroundColor = .white
        cv.register(VideoCell.self, forCellWithReuseIdentifier: Constant.cellId)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()
    
    var videos: [Video] = []
    
    // MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    
    func fetchVideos() {
        ApiService.shared.fetchVideo(with: URLInfo.homeURL, completion: {
            videos in
            
            self.videos = videos
            self.collectionView.reloadData()
        })
    }
}

extension HomeController: UICollectionViewDelegateFlowLayout, UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return videos.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.cellId, for: indexPath) as? VideoCell else {
            fatalError("Invalid cell Identifier.")
        }
        
        return cell
    }
    
    
}
