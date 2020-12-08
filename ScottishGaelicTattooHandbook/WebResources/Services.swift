//
//  Services.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 12/6/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//
import Foundation

class BlogPostService: HTTPService<[BlogPost]> {
    init() {
        super.init(endpoint: "https://gaelic.co/wp-json/wp/v2/posts?per_page=3")
    }
}

class PhraseCategoryService: HTTPService<[String]> {
    
    
    override func unwrap(_ data: Data) throws -> [String] {
        return [
            "Place & Identity",
            "Family",
            "Love & Friendship",
            "In Memoriam",
            "Religious & Spiritual",
            "Courage, Honor & Military",
            "Work, Activity & Identity",
            "Emotion, Quality & Concepts",
            "Gaelic Proverbs & Expressions"
    ]
    }
}
