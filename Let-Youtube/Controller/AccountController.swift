//
//  AccountController.swift
//  Let-Youtube
//
//  Created by 이운형 on 2019/11/19.
//  Copyright © 2019 201302458. All rights reserved.
//

import UIKit

class AccountController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    private struct Constant {
        static let settingCellId = "setting_cell"
        static let userCellId = "user_cell"
        static let headerIdentifier = "section_header"
        static let userCellHeight:CGFloat = 75
        static let cellHeight:CGFloat = 50
        static let cvHeight:CGFloat = 50*8
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.delaysContentTouches = false
        cv.bounces = true
        cv.alwaysBounceVertical = true
        cv.backgroundColor = UIColor.white
        cv.register(SettingCell.self, forCellWithReuseIdentifier: Constant.settingCellId)
        cv.register(UserCell.self, forCellWithReuseIdentifier: Constant.userCellId)
        cv.register(UICollectionReusableView.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constant.headerIdentifier)
        cv.delegate = self
        cv.dataSource = self
        return cv
    }()

    var settings: [Setting] = {
        return [Setting(name: .myChannel, imageName: "ico_more_setting"),
                Setting(name: .watchingTime, imageName: "ico_more_privacy"),
                Setting(name: .premiumEnroll, imageName: "ico_more_feedback"),
                Setting(name: .payMembership, imageName: "ico_more_help"),
                Setting(name: .convertAccount, imageName: "ico_more_switch"),
                Setting(name: .useSecretMode, imageName: "ico_more_cancel"),
                Setting(name: .userSetting, imageName: "ico_more_setting"),
                Setting(name: .userRequest, imageName: "ico_more_help")]
    }()

    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupNavigationBar()
        setupCollectionView()
    }
    
    // MARK: UI 
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        let cancelImage = UIImage(named: "ico_more_cancel")?.withRenderingMode(.alwaysOriginal)
        let cancelButton = UIButton(type: .custom)
        cancelButton.setImage(cancelImage, for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonTouched(_:)), for: .touchUpInside)
        cancelButton.contentMode = .scaleAspectFit
        let cancelBarButton = UIBarButtonItem(customView: cancelButton)
        
        let logoTextView = UITextField()
        logoTextView.text = "계정"
        logoTextView.font = UIFont.systemFont(ofSize: 16)
        logoTextView.isSelected = false
        logoTextView.isUserInteractionEnabled = false
        let logoTextItem = UIBarButtonItem(customView: logoTextView)
        
        let spaceView = UIView(frame: CGRect(x: 0, y: 0, width: 4, height: 1))
        let spaceItem = UIBarButtonItem(customView: spaceView)
        
        navigationItem.leftBarButtonItems = [cancelBarButton, spaceItem, logoTextItem]
    }
    
    private func setupCollectionView() {
        view.addSubview(collectionView)
    
        view.addConstraintsWithFormat(format: "H:|[v0]|", views: collectionView)
        view.addConstraintsWithFormat(format: "V:|[v0]|", views: collectionView)
//        let guide = view.safeAreaLayoutGuide
//
//        NSLayoutConstraint.activate([
//            collectionView.leftAnchor.constraint(equalTo: guide.leftAnchor),
//            collectionView.rightAnchor.constraint(equalTo: guide.rightAnchor),
//            collectionView.topAnchor.constraint(equalTo: guide.topAnchor),
//            collectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
//        ])
    }
    
    // MARK: IBAction Methods
    @objc func cancelButtonTouched(_ sender: UIBarButtonItem) {
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - CollectionView Methods
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constant.headerIdentifier, for: indexPath)
        headerView.backgroundColor = UIColor.rgb(red: 210, green: 210, blue: 210, alpha: 1)
        
        return headerView
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        switch section {
        case 0:
            return 1
        case 1:
            return settings.count - 2
        case 2:
            return 2
        default:
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.userCellId, for: indexPath) as? UserCell else {
                fatalError("\(Constant.settingCellId) is invalid identifier.")
            }
            return cell
        }
        
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.settingCellId, for: indexPath) as? SettingCell else {
            fatalError("\(Constant.settingCellId) is invalid identifier.")
        }
        
        if indexPath.section == 1 {
            cell.setting = settings[indexPath.item]
        } else if indexPath.section == 2 {
            cell.setting = settings[settings.count - 2 + indexPath.item]
        }
        
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        switch indexPath.section {
        case 0:
            return CGSize(width: collectionView.frame.width, height: Constant.userCellHeight)
        default:
            return CGSize(width: collectionView.frame.width, height: Constant.cellHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        
        switch section {
        case 0:
            return CGSize(width: collectionView.frame.width, height: 0)
        default:
            return CGSize(width: collectionView.frame.width, height: 1)
        }
    }

}
