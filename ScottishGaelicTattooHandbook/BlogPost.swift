//
//  BlogPost.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 7/26/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

import Foundation

struct BlogPost: Codable {
    var imageURL: String
    var title: String

    enum RootKeys: String, CodingKey {
        case imageURL = "jetpack_featured_media_url"
        case title
    }
    
    enum TitleKeys: String, CodingKey {
        case title = "rendered"
    }
    
    init(title: String, imageURL: String) {
        self.title = title
        self.imageURL = imageURL
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: RootKeys.self)
        self.imageURL = try container.decode(String.self, forKey: .imageURL)
        let titleContainer = try container.nestedContainer(keyedBy: TitleKeys.self, forKey: .title)
        self.title = try titleContainer.decode(String.self, forKey: .title)
    }
}
