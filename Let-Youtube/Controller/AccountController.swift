//
//  AccountController.swift
//  Let-Youtube
//
//  Created by 이운형 on 2019/11/19.
//  Copyright © 2019 201302458. All rights reserved.
//

import UIKit

class AccountController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor.red
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        let cancelImage = UIImage(named: "ico_more_cancel")?.withTintColor(UIColor.darkGray)
        let cancelBarButton = UIBarButtonItem(image: cancelImage, style: .plain, target: self, action: #selector(cancelButtonTouched(_:)))
        cancelBarButton.tintColor = UIColor.darkGray
        navigationItem.leftBarButtonItems = [cancelBarButton]
    }
    
    @objc func cancelButtonTouched(_ sender: UIBarButtonItem) {
        print("Cancel Button Touched.")
    }
}
