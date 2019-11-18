//
//  ThumbnailImageView.swift
//  Let-Youtube
//
//  Created by 이운형 on 2019/11/18.
//  Copyright © 2019 201302458. All rights reserved.
//

import UIKit

let imageCache = NSCache<NSString, UIImage>()

class ThumbnailImageView: UIImageView {
    
    var imageUrlString: String?
    
    func loadImageWith(urlString: String) {
        
        imageUrlString = urlString
        
        guard let url = URL(string: urlString) else {
            print("Invalid Image URL.")
            return
        }
        
        image = nil
        
        if let cacheToImage = imageCache.object(forKey: urlString as NSString) {
            self.image = cacheToImage
            return
        }
        
        URLSession(configuration: .default).dataTask(with: url) {
            data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            DispatchQueue.main.async {
                guard let imageToCache = UIImage(data: data) else { return }
                
                if self.imageUrlString == urlString {
                    self.image = imageToCache
                }
                
                imageCache.setObject(imageToCache, forKey: urlString as NSString)
            }
        }.resume()
    }
}
