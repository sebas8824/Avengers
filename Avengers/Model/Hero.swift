//
//  Section.swift
//  Spiderman
//
//  Created by Sebastian on 11/24/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import Foundation
import UIKit

struct Hero {
    private(set) public var image: String
    private(set) public var heroName: String
    private(set) public var heroId: String
    private(set) public var logo: String
    private(set) public var headerColor: UIColor
    private(set) public var backgroundColor: UIColor
    
    init(image: String, heroId: String, heroName: String, logo: String, headerColor: UIColor, backgroundColor: UIColor) {
        self.image = image
        self.heroName = heroName
        self.heroId = heroId
        self.logo = logo
        self.headerColor = headerColor
        self.backgroundColor = backgroundColor
    }
}
