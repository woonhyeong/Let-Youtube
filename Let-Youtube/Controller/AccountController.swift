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
        
        view.backgroundColor = UIColor.white
        setupNavigationBar()
    }
    
    private func setupNavigationBar() {
        navigationController?.navigationBar.barTintColor = UIColor.white
        
        let cancelImage = UIImage(named: "ico_more_cancel")?.withRenderingMode(.alwaysOriginal)
        let cancelButton = UIButton(type: .custom)
        cancelButton.setImage(cancelImage, for: .normal)
        cancelButton.addTarget(self, action: #selector(cancelButtonTouched(_:)), for: .touchUpInside)
        cancelButton.contentMode = .scaleAspectFit
        let cancelBarButton = UIBarButtonItem(customView: cancelButton)
        
        navigationItem.leftBarButtonItems = [cancelBarButton]
    }
    
    @objc func cancelButtonTouched(_ sender: UIBarButtonItem) {
        print("Cancel Button Touched.")
        dismiss(animated: true, completion: nil)
    }
}
