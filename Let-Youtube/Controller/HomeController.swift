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

        fetchVideos()
        
        view.addSubview(collectionView)
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
        
        setupNavBarButtons()
    }
    
    private func setupNavBarButtons() {
        let searchImage = UIImage(named: "ico_search")
        let searchBarButtonItem = UIBarButtonItem(image: searchImage, style: .plain, target: self, action: #selector(touchedSearchButton(_:)))
        searchBarButtonItem.tintColor = .gray
        
        let moreImage = UIImage(named: "ico_more_switch")
        let moreButtonItem = UIBarButtonItem(image: moreImage, style: .plain, target: self, action: #selector(touchedMoreButton(_:)))
        moreButtonItem.tintColor = .gray
        
        navigationItem.rightBarButtonItems = [moreButtonItem, searchBarButtonItem]
        navigationController?.hidesBarsOnSwipe = true
    }
    
    func fetchVideos() {
        ApiService.shared.fetchVideo(with: URLInfo.homeURL, completion: {
            videos in
            
            self.videos = videos
            self.collectionView.reloadData()
        })
    }
    
    // Mark: IBAction Methods
    @objc func touchedSearchButton(_ sender: UIBarButtonItem) {
        print("Search button Tapped.")
    }
    
    @objc func touchedMoreButton(_ sender: UIBarButtonItem) {
        print("More button Tapped.")
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
        
        cell.video = videos[indexPath.item]
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let height = (self.view.frame.width - 16 - 16) * 9 / 16
        return CGSize(width: self.view.frame.width, height: height + 16 + 88)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
