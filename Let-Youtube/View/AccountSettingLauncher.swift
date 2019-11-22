//
//  UserSettingLauncher.swift
//  Let-Youtube
//
//  Created by 이운형 on 2019/11/22.
//  Copyright © 2019 201302458. All rights reserved.
//

import UIKit

class AccountSettingLauncher: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private struct Constant {
        static let cellIdentifier = "user_setting_cell"
        static let cellHeight:CGFloat = 55
        static let cvHeight:CGFloat = 55*6
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.delegate = self
        cv.dataSource = self
        cv.register(SettingCell.self, forCellWithReuseIdentifier: Constant.cellIdentifier)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var settings: [Setting] = {
        return [Setting(name: .myChannel, imageName: "ico_more_setting"),
                Setting(name: .watchingTime, imageName: "ico_more_privacy"),
                Setting(name: .premiumEnroll, imageName: "ico_more_feedback"),
                Setting(name: .payMembership, imageName: "ico_more_help"),
                Setting(name: .convertAccount, imageName: "ico_more_switch"),
                Setting(name: .useSecretMode, imageName: "ico_more_cancel")]
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        addSubview(collectionView)
        setupSettingView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    // MARK: - Custom Methods
    private func setupSettingView() {
        let keyWindow = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        guard let window = keyWindow else { return }
        
        collectionView.frame = CGRect(x: 0, y: 0, width: window.frame.width, height: Constant.cvHeight)
    }
    
    // MARK: - CollectionView Methods
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 6
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.cellIdentifier, for: indexPath) as? SettingCell else {
            fatalError("\(Constant.cellIdentifier) is invalid identifier.")
        }
        
        cell.setting = settings[indexPath.item]
        cell.backgroundColor = UIColor.white
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: Constant.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }

}
