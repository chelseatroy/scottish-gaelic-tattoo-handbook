//
//  Services.swift
//  ScottishGaelicTattooHandbook
//
//  Created by Chelsea Troy on 12/6/20.
//  Copyright © 2020 Chelsea Troy. All rights reserved.
//

class BlogPostService: HTTPService<[BlogPost]> {
    init() {
        super.init(endpoint: "https://gaelic.co/wp-json/wp/v2/posts?per_page=3")
    }
}
