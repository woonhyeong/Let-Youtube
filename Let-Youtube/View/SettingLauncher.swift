//
//  SettingLauncher.swift
//  Let-Youtube
//
//  Created by 이운형 on 2019/11/20.
//  Copyright © 2019 201302458. All rights reserved.
//

import UIKit

class SettingLauncher: NSObject, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private struct Constant {
        static let cellIdentifier = "SettingLauncherCell"
        static let headerIdentifier = "section_header"
        static let cellHeight:CGFloat = 50
        static let cvHeight:CGFloat = 50*6
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = UIColor.darkGray
        cv.isScrollEnabled = false
        cv.register(SettingCell.self, forCellWithReuseIdentifier: Constant.cellIdentifier)
        cv.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constant.headerIdentifier)
        cv.dataSource = self
        cv.delegate = self
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    var settings: [Setting] = {
        return [Setting(name: .Settings, imageName: "ico_more_setting"),
                Setting(name: .TermAndPrivacy, imageName: "ico_more_privacy"),
                Setting(name: .SendFeedback, imageName: "ico_more_feedback"),
                Setting(name: .Help, imageName: "ico_more_help"),
                Setting(name: .SwitchAccount, imageName: "ico_more_switch"),
                Setting(name: .Cancel, imageName: "ico_more_cancel")]
    }()
    
    let blackView = UIView()
    
    var homeController: HomeController?
    
    override init() {
        super.init()
    }
    
    // MARK: - Public Methods
    func showSettingView() {
        let keyWindow = UIApplication.shared.windows.filter { $0.isKeyWindow }.first
        guard let window = keyWindow else { return }
        
        blackView.backgroundColor = UIColor(white: 0, alpha: 0.5)
        blackView.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(tappedBlackView)))
        window.addSubview(blackView)
        window.addSubview(collectionView)
        
        blackView.frame = window.frame
        blackView.alpha = 0
        collectionView.backgroundColor = UIColor.white
        collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: Constant.cvHeight)
        
        let cY = window.frame.height - Constant.cvHeight
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseOut, animations: {
            self.blackView.alpha = 1.0
            self.collectionView.frame = CGRect(x: 0, y: cY, width: window.frame.width, height: Constant.cvHeight)
        }, completion: nil)
    }
    
    @objc private func tappedBlackView() {
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.blackView.alpha = 0
            let keyWindow = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
            guard let window = keyWindow else { return }
            
            self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: Constant.cvHeight)
        }, completion: {
            bool in
            self.blackView.removeFromSuperview()
            self.collectionView.removeFromSuperview()
        })
    }
    
    // MARK: - UICollectionViewDelegate/DataSource
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return settings.count - 1
        case 1:
            return 1
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.cellIdentifier, for: indexPath) as? SettingCell else {
            fatalError("\(Constant.cellIdentifier) is invalid cell identifier.")
        }
        
        if indexPath.section == 0 {
            cell.setting = settings[indexPath.item]
        } else {
            cell.setting = settings[settings.count - 1]
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        // let settingMode = settings[indexPath.item].name
        
        UIView.animate(withDuration: 0.5, delay: 0, usingSpringWithDamping: 1, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.blackView.alpha = 0
            let keyWindow = UIApplication.shared.windows.filter{$0.isKeyWindow}.first
            guard let window = keyWindow else { return }
            
            self.collectionView.frame = CGRect(x: 0, y: window.frame.height, width: window.frame.width, height: Constant.cvHeight)
        }, completion: {
            bool in
            self.blackView.removeFromSuperview()
            self.collectionView.removeFromSuperview()
            // Add action to excute at homeController
            // ex) homeController.function()
        })
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constant.headerIdentifier, for: indexPath)
        headerView.backgroundColor = UIColor.rgb(red: 210, green: 210, blue: 210, alpha: 1)
        
        return headerView
    }
    
    // MARK: - UICollectionViewDelegateFlowLayout
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        return CGSize(width: collectionView.frame.width, height: Constant.cellHeight)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 0 {
            return CGSize(width: 0, height: 0)
        }
        return CGSize(width: collectionView.frame.width, height: 1)
    }
}

