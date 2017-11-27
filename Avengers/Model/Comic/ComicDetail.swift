//
//  ComicDetail.swift
//  Spiderman
//
//  Created by Sebastian on 11/26/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import Foundation
import UIKit

struct ComicDetail {
    private(set) public var comicTitle: String
    private(set) public var comicImage: UIImage
    private(set) public var publishedDate: String
    private(set) public var comicCreators: [ComicCreator]
    private(set) public var comicDescription: String
        
    init(comicTitle: String, comicImage: UIImage, publishedDate: String, comicCreators: [ComicCreator], comicDescription: String) {
        self.comicTitle = comicTitle
        self.comicImage = comicImage
        self.publishedDate = publishedDate
        self.comicCreators = comicCreators
        self.comicDescription = comicDescription
    }
}
