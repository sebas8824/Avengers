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
        Hero(image: "ironman-img.jpg", heroId: "1009368", heroName: "Iron Man", logo: "ironman-logo.png", headerColor: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), backgroundColor: #colorLiteral(red: 0.9529411793, green: 0.6862745285, blue: 0.1333333403, alpha: 1)),
        Hero(image: "hulk-img.jpg", heroId: "1009351", heroName: "Hulk", logo: "hulk-logo.png", headerColor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), backgroundColor: #colorLiteral(red: 0.1960784346, green: 0.3411764801, blue: 0.1019607857, alpha: 1)),
        Hero(image: "thor-img.jpg", heroId: "1009664", heroName: "Thor", logo: "thor-logo.png", headerColor: #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), backgroundColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)),
        Hero(image: "captain-img.jpg", heroId: "1009220", heroName: "Captain America", logo: "captain-logo.png", headerColor: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), backgroundColor: #colorLiteral(red: 0.1764705926, green: 0.4980392158, blue: 0.7568627596, alpha: 1)),
        Hero(image: "widow-img.jpg", heroId: "1009189", heroName: "Black Widow", logo: "widow-logo.png", headerColor: #colorLiteral(red: 0.7450980544, green: 0.1568627506, blue: 0.07450980693, alpha: 1), backgroundColor: #colorLiteral(red: 0.1298420429, green: 0.1298461258, blue: 0.1298439503, alpha: 1)),
        Hero(image: "hawkeye-img.jpg", heroId: "1009338", heroName: "Hawkeye", logo: "hawkeye-logo.png", headerColor: #colorLiteral(red: 0.3647058904, green: 0.06666667014, blue: 0.9686274529, alpha: 1), backgroundColor: #colorLiteral(red: 0.5396263213, green: 0.4000264703, blue: 0.6848868227, alpha: 1))
    ]
    
    func getHeroes() -> [Hero] {
        return heroes
    }
    
}
