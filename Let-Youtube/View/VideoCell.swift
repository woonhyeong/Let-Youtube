//
//  VideoCell.swift
//  Let-Youtube
//
//  Created by 이운형 on 2019/11/17.
//  Copyright © 2019 201302458. All rights reserved.
//

import UIKit

class VideoCell: BaseCell {
    
    var video: Video? {
        didSet {
            videoTitleLabel.text = video?.title
            
            setupThumbnailImage()
            setupProfileImage()
            
            if let channelName = video?.channel.name, let views = video?.numberOfViews {
                let fomatter = NumberFormatter()
                fomatter.numberStyle = .decimal
                let number = NSNumber(value: views)
                
                let subtitleText = "\(channelName) * \(fomatter.string(from: number)!) * 2years"
                videoInfoLabel.text = subtitleText
            }
            
            if let title = video?.title {
                let fontHeight = title.heightWithConstrainedWidth(width: frame.width - 32 - 44 - 8, font: UIFont.systemFont(ofSize: 16))
                
                if fontHeight > 20 {
                    titleLabelHeightConstraint.constant = 44
                } else {
                    titleLabelHeightConstraint.constant = 20
                }
            }
        }
    }
    
    let thumbnailImageView: ThumbnailImageView = {
        let imageView = ThumbnailImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.backgroundColor = UIColor.lightGray
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        return imageView
    }()
    
    let userProfileImageView: ThumbnailImageView = {
        let imageView = ThumbnailImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 22
        imageView.layer.masksToBounds = true
        return imageView
    }()
    
    let videoTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.numberOfLines = 2
        label.lineBreakMode = .byWordWrapping
        return label
    }()
    
    let videoInfoLabel: UITextView = {
        let textView = UITextView()
        textView.translatesAutoresizingMaskIntoConstraints = false
        textView.textContainerInset = UIEdgeInsets(top: 0, left: -4, bottom: 0, right: 0)
        textView.textColor = .lightGray
        return textView
    }()
    
    let separatorView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor.rgb(red: 230, green: 230, blue: 230, alpha: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var titleLabelHeightConstraint: NSLayoutConstraint = videoTitleLabel.heightAnchor.constraint(equalToConstant: 20)
    
    override func setupViews() {
        self.addSubview(thumbnailImageView)
        self.addSubview(userProfileImageView)
        self.addSubview(videoTitleLabel)
        self.addSubview(videoInfoLabel)
        self.addSubview(separatorView)
        
        addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: thumbnailImageView)
        addConstraintsWithFormat(format: "H:|-16-[v0(44)]", views: userProfileImageView)
        
        addConstraintsWithFormat(format: "V:|-16-[v0]-8-[v1(44)]-36-[v2(1)]|", views: thumbnailImageView, userProfileImageView, separatorView)
        addConstraintsWithFormat(format: "H:|[v0]|", views: separatorView)

        NSLayoutConstraint.activate([
            videoTitleLabel.topAnchor.constraint(equalTo: thumbnailImageView.bottomAnchor, constant: 8),
            videoTitleLabel.leftAnchor.constraint(equalTo: userProfileImageView.rightAnchor, constant: 8),
            videoTitleLabel.rightAnchor.constraint(equalTo: thumbnailImageView.rightAnchor),
            titleLabelHeightConstraint,
            videoInfoLabel.topAnchor.constraint(equalTo: videoTitleLabel.bottomAnchor, constant: 4),
            videoInfoLabel.leftAnchor.constraint(equalTo: userProfileImageView.rightAnchor, constant: 8),
            videoInfoLabel.rightAnchor.constraint(equalTo: thumbnailImageView.rightAnchor),
            videoInfoLabel.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    func setupProfileImage() {
        if let profileImageURL = video?.channel.profileImageName {
            userProfileImageView.loadImageWith(urlString: profileImageURL)
        }
    }
    
    func setupThumbnailImage() {
        if let thumbnailImageURL = video?.thumbnailImageName {
            thumbnailImageView.loadImageWith(urlString: thumbnailImageURL)
        }
    }
}

class BaseCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    func setupViews() {}
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented.")
    }
}
