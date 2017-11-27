//
//  ComicCreators.swift
//  Spiderman
//
//  Created by Sebastian on 11/26/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import Foundation

struct ComicCreator {
    private(set) var creatorName: String
    private(set) var creatorRole: String
    
    init(creatorName: String, creatorRole: String) {
        self.creatorName = creatorName
        self.creatorRole = creatorRole
    }
}
