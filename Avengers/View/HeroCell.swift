//
//  HeroCell.swift
//  Spiderman
//
//  Created by Sebastian on 11/24/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import UIKit

class HeroCell: UITableViewCell {

    @IBOutlet weak var heroImage: UIImageView!
    @IBOutlet weak var heroName: UILabel!
    
    func updateViews(hero: Hero) {
        heroImage.image = UIImage(named: hero.image)
        heroName.text = hero.heroName
    }

}
