//
//  Comic.swift
//  Spiderman
//
//  Created by Sebastian on 11/24/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import Foundation
import UIKit

struct Comic {
    private(set) public var imageUrl: String
    private(set) public var title: String
    private(set) public var issueNumber: String
    private(set) public var pages: String
    private(set) public var price: String
    private(set) public var image: UIImage
    private(set) public var comicURL: String
    
    init(imageUrl: String, title: String, issueNumber: String, pages: String, price: String, comicURL: String) {
        self.imageUrl = imageUrl
        self.title = title
        self.issueNumber = issueNumber
        self.pages = pages
        self.price = price
        self.image = UIImage(named: "unavailable-img")!
        self.comicURL = comicURL
    }
    
    init(image: UIImage, comic: Comic) {
        self.image = image
        self.imageUrl = comic.imageUrl
        self.title = comic.title
        self.issueNumber = comic.issueNumber
        self.pages = comic.pages
        self.price = comic.price
        self.comicURL = comic.comicURL
    }
    
}
