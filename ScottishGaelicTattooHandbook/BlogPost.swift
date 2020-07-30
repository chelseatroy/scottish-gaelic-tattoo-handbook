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
    var title: Title

    enum CodingKeys: String, CodingKey {
        case imageURL = "jetpack_featured_media_url"
        case title = "title"
    }
}

struct Title: Codable {
    var rendered: String
}
