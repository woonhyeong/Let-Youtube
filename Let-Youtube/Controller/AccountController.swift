//
//  AccountController.swift
//  Let-Youtube
//
//  Created by 이운형 on 2019/11/19.
//  Copyright © 2019 201302458. All rights reserved.
//

import UIKit

class AccountController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    struct Constant {
        static let accountCell = "account_cell"
        static let menuCell = "menu_cell"
    }
    
    lazy var collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: CGRect(x: 0, y: 0, width: 0, height: 0), collectionViewLayout: layout)
        cv.backgroundColor = UIColor.white
        cv.delegate = self
        cv.dataSource = self
        cv.register(AccountSettingLauncher.self, forCellWithReuseIdentifier: Constant.accountCell)
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    // MARK: Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.white
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
        
        let guide = view.safeAreaLayoutGuide
        
        NSLayoutConstraint.activate([
            collectionView.leftAnchor.constraint(equalTo: guide.leftAnchor),
            collectionView.rightAnchor.constraint(equalTo: guide.rightAnchor),
            collectionView.topAnchor.constraint(equalTo: guide.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor)
        ])
    }
    
    // MARK: IBAction Methods
    @objc func cancelButtonTouched(_ sender: UIBarButtonItem) {
        print("Cancel Button Touched.")
        dismiss(animated: true, completion: nil)
    }
    
    // MARK: - CollectionView Metohds
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constant.accountCell, for: indexPath) as! AccountSettingLauncher
        return cell
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 330)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}
