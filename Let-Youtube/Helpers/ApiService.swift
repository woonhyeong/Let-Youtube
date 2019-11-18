//
//  APIService.swift
//  Let-Youtube
//
//  Created by 이운형 on 2019/11/17.
//  Copyright © 2019 201302458. All rights reserved.
//

import UIKit

class ApiService: NSObject {
    
    static let shared = ApiService()
    
    private override init() { super.init() }
    
    func fetchVideo(with URLString: String, completion: @escaping ([Video]) -> ()) {
        guard let url = URL(string: URLString) else {
            print("\(URLString) is invalid URL.")
            return
        }
        
        URLSession(configuration: .default).dataTask(with: url) {
            data, response, error in
            
            if let error = error {
                print(error.localizedDescription)
                return
            }
            
            guard let data = data else { return }
            
            do {
                var videos = [Video]()
                let apiResponse = try JSONDecoder().decode([Video].self, from: data)
                videos = apiResponse
                
                DispatchQueue.main.async {
                    completion(videos)
                }
            } catch let jsonError {
                print(jsonError.localizedDescription)
            }
        }.resume()
    }
}
