//
//  SectionDefaultData.swift
//  Spiderman
//
//  Created by Sebastian on 11/24/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import Foundation

//
//  DataService.swift
//  CoderSwag
//
//  Created by Sebastian on 11/4/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import Foundation

class HeroDefaultData {
    static let instance = HeroDefaultData()
    
    // Datasource
    private let heroes = [
        Hero(image: "ironman-img.jpg", heroId: "1009368", heroName: "Iron Man", logo: "ironman-logo.png"),
        Hero(image: "hulk-img.jpg", heroId: "1009351", heroName: "Hulk", logo: "hulk-logo.png"),
        Hero(image: "thor-img.jpg", heroId: "1009664", heroName: "Thor", logo: "thor-logo.png"),
        Hero(image: "captain-img.jpg", heroId: "1009220", heroName: "Captain America", logo: "captain-logo.png"),
        Hero(image: "widow-img.jpg", heroId: "1009189", heroName: "Black Widow", logo: "widow-logo.png"),
        Hero(image: "hawkeye-img.jpg", heroId: "1009338", heroName: "Hawkeye", logo: "hawkeye-logo.png")
    ]
    
    func getHeroes() -> [Hero] {
        return heroes
    }
    
}
