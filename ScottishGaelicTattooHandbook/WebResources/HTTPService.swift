//
//  BlogPostService.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 7/26/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import Foundation

enum HTTPServiceError: Error {
    case problemGeneratingURL
    case problemGettingDataFromAPI
    case problemDecodingData
}

class HTTPService<T: Decodable> {
    var urlString: String
    
    // TODO: Replace default endpoint, which servesto prevent problemGettingDataFromAPI error
    // on services that stub the completion result.
    init(endpoint: String = "https://gaelic.co/wp-json/wp/v2/posts?per_page=3") {
        self.urlString = endpoint
    }
    
    func unwrap(_ data: Data) throws -> T {
        return try JSONDecoder().decode(T.self, from: data)
    }
    
    func retrieve(completion: @escaping (T?, Error?) -> ()) {
            guard let url = URL(string: self.urlString) else {
                DispatchQueue.main.async { completion(nil, HTTPServiceError.problemGeneratingURL) }
                return
        }
                
            let request = URLRequest(url: url)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {
                    DispatchQueue.main.async { completion(nil, HTTPServiceError.problemGettingDataFromAPI) }
                    return
                }
                
                do {
                    let result = try self.unwrap(data)
                    DispatchQueue.main.async { completion(result, nil) }
                } catch (let error) {
                    print(error)
                    DispatchQueue.main.async { completion(nil, HTTPServiceError.problemDecodingData) }
                }
                                                        
            }
            task.resume()
        }
}
