//
//  ComicCell.swift
//  Spiderman
//
//  Created by Sebastian on 11/24/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import UIKit

class ComicCell: UITableViewCell {
    
    
    @IBOutlet weak var comicImage: UIImageView!
    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var issueNumberLabel: UILabel!
    @IBOutlet weak var comicTitleLabel: UILabel!
    @IBOutlet weak var numberOfPagesLabel: UILabel!
    
    let headerIssueNumber = "Issue #"
    let headerNumberOfPages = "Pages "
    let headerPrice = "Price "
    
    func updateViews(comic: Comic) {
        comicImage.image = comic.image
        comicTitleLabel.text = comic.title
        
        if comic.price == "0" {
            priceLabel.text = "Price unavailable"
        } else {
            priceLabel.text = "\(headerPrice) \(comic.price)"
        }
        
        if comic.issueNumber == "0" {
            issueNumberLabel.text = "Issue number unavailable"
        } else {
            issueNumberLabel.text = "\(headerIssueNumber) \(comic.issueNumber)"
        }
        
        if comic.pages == "0" {
            numberOfPagesLabel.text = "Number of pages unavailable"
        } else {
            numberOfPagesLabel.text = "\(headerNumberOfPages) \(comic.pages)"
        }
        
    }
    
    func updateImageView(image: UIImage) {
        comicImage.image = image
    }

}
