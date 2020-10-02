//
//  BlogPostService.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 7/26/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import Foundation

enum BlogPostCallingError: Error {
    case problemGeneratingURL
    case problemGettingDataFromAPI
    case problemDecodingData
}

class BlogPostService {
    private let urlString = "https://gaelic.co/wp-json/wp/v2/posts?per_page=3"
    
    func getBlogPosts(completion: @escaping ([BlogPost]?, Error?) -> ()) {
            guard let url = URL(string: self.urlString) else {
                DispatchQueue.main.async { completion(nil, BlogPostCallingError.problemGeneratingURL) }
                return
        }
                
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    DispatchQueue.main.async { completion(nil, BlogPostCallingError.problemGettingDataFromAPI) }
                    return
                }
                
                do {
                    let blogPosts = try JSONDecoder().decode([BlogPost].self, from: data)
                    DispatchQueue.main.async { completion(blogPosts, nil) }
                } catch (let error) {
                    print(error)
                    DispatchQueue.main.async { completion(nil, BlogPostCallingError.problemDecodingData) }
                }
                                                        
            }
            task.resume()
        }

    
}
