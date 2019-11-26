//
//  UserAccountCell.swift
//  Let-Youtube
//
//  Created by 이운형 on 2019/11/25.
//  Copyright © 2019 201302458. All rights reserved.
//

import UIKit

class UserCell: BaseCell {
    let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Woonhyeong"
        return label
    }()
    
    let emailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 13)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "tlsehddkql12@gmail.com"
        return label
    }()
    
    lazy var managementButton: UIButton = {
        let button = UIButton(type: .custom)
        button.setTitle("Google 계정 관리", for: .normal)
        button.setTitleColor(UIColor.rgb(red: 0, green: 122, blue: 255, alpha: 1), for: .normal)
        button.setTitleColor(UIColor.blue, for: .highlighted)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 13)
        button.contentHorizontalAlignment = .left
        button.addTarget(self, action: #selector(managementLabelTouched(_:)), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let userProfileImageView: UIImageView = {
        let imageView = UIImageView(image: UIImage(named: "ico_more_switch")?.withTintColor(UIColor.brown))
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()

    override func setupViews() {
        super.setupViews()
        
        setupUI()
    }
    
    @objc func managementLabelTouched(_ sender: UIButton) {
        print("management button touched.")
    }
    
    private func setupUI() {
        addSubview(userProfileImageView)
        addSubview(nameLabel)
        addSubview(emailLabel)
        addSubview(managementButton)
        
        /*
         총 셀의 높이 = 최소 60 ( bottom 15를 추가하면 75 )
         name, email, management label height = 15
         name.top = 15
         */
        NSLayoutConstraint.activate([
            userProfileImageView.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            userProfileImageView.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 15),
            userProfileImageView.widthAnchor.constraint(equalToConstant: 38),
            userProfileImageView.heightAnchor.constraint(equalToConstant: 38),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            nameLabel.leftAnchor.constraint(equalTo: userProfileImageView.rightAnchor, constant: 15),
            nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor, constant: -10),
            nameLabel.heightAnchor.constraint(equalToConstant: 15),
            emailLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 4),
            emailLabel.leftAnchor.constraint(equalTo: nameLabel.leftAnchor),
            emailLabel.rightAnchor.constraint(equalTo: nameLabel.rightAnchor),
            emailLabel.heightAnchor.constraint(equalToConstant: 15),
            managementButton.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 4),
            managementButton.leftAnchor.constraint(equalTo: emailLabel.leftAnchor),
            managementButton.rightAnchor.constraint(equalTo: emailLabel.rightAnchor),
            managementButton.heightAnchor.constraint(equalToConstant: 15)
        ])

    }
}
