//
//  FavoriteItemCell.swift
//  Avengers
//
//  Created by Sebastián Benitez on 11/28/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import UIKit

class FavoriteItemCell: UICollectionViewCell {
    
    @IBOutlet weak var favoriteComicTitle: UILabel!
    @IBOutlet weak var favoriteComicImage: UIImageView!
    @IBOutlet weak var favoriteDetailsButton: UIButton!
    
    func updateViews(comic: ComicData) {
        favoriteComicImage.image = UIImage(data: comic.comicImage! as Data, scale: 1.0)
        favoriteComicTitle.text = comic.comicTitle?.uppercased()
    }
}
