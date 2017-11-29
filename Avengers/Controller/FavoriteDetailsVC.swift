//
//  FavoriteDetailsVC.swift
//  Avengers
//
//  Created by Sebastian on 11/27/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import UIKit
import CoreData

class FavoriteDetailsVC: UIViewController {
    @IBOutlet weak var favoriteComicTitle: UILabel!
    @IBOutlet weak var comicPublishedDate: UILabel!
    @IBOutlet weak var authorsList: UIStackView!
    @IBOutlet weak var comicImage: UIImageView!
    @IBOutlet weak var comicDescription: UILabel!
    @IBOutlet weak var scrollView: UIScrollView!
    
    private var favoriteComic: ComicData!
    
    override func viewDidLoad() {
        super.viewDidLoad()        
        updateViews()
        // Do any additional setup after loading the view.
    }

    func initSection(comicDetail: ComicData) {
        favoriteComic = comicDetail
    }
    
    func updateViews() {
        favoriteComicTitle.text = favoriteComic.comicTitle
        comicPublishedDate.text = favoriteComic.publishedDate ?? "Published date not available"
        comicDescription.text = favoriteComic.comicDescription ?? "Description not available"
        comicImage.image = UIImage(data: favoriteComic.comicImage as! Data)
        setUpAuthorsView(creators: favoriteComic.authors?.allObjects as! [ComicAuthor])
    }
    
    func setUpAuthorsView(creators: [ComicAuthor]) {
        let viewWidth = authorsList.frame.origin.x
        let viewHeight = authorsList.frame.origin.y
        for creator in creators {
            var totalHeigth = 0
            let creatorLabel = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(totalHeigth), width: viewWidth, height: CGFloat(Int(viewHeight) / creators.count)))
            let name = creator.name
            let role = creator.role
            creatorLabel.text = "\(name!) - \(role!)"
            creatorLabel.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
            creatorLabel.numberOfLines = 0
            creatorLabel.font = UIFont(name: "Avenir Next", size: 14.0)
            creatorLabel.textAlignment = .left
            authorsList.addArrangedSubview(creatorLabel)
            totalHeigth += Int(viewHeight) / creators.count
        }
    }

}
