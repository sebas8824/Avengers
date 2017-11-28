//
//  ComicDetailVC.swift
//  Spiderman
//
//  Created by Sebastian on 11/25/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import UIKit
import CoreData

class ComicDetailVC: UIViewController {

    @IBOutlet weak var comicDetailBackground: UIView!
    @IBOutlet weak var comicTitleDetail: UILabel!
    @IBOutlet weak var comicPublished: UILabel!
    @IBOutlet weak var comicImageDetail: UIImageView!
    @IBOutlet weak var comicDescriptionDetail: UILabel!
    @IBOutlet weak var authorsStackView: UIStackView!
    @IBOutlet weak var addToFavorites: UIBarButtonItem!
    
    private var appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistenceContainer.viewContext
    
    var comicFromVC: Comic!
    var comicDetailApi: ApiRequestTransformer = ApiRequestTransformer()
    var objectBuilder: ObjectBuilder = ObjectBuilder()
    var globalComicDetail: ComicDetail!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        comicDetailApi.comicRequestByComicId(forComic: comicFromVC) { (comicDetail) in
            self.updateView(comic: self.comicFromVC, detail: comicDetail)
        }
    }

    func initComicDetail(comic: Comic) {
        comicFromVC = comic
    }
    
    func updateView(comic: Comic, detail: ComicDetail) {
        comicImageDetail.image = comic.image
        comicTitleDetail.text = comic.title.uppercased()
        comicDescriptionDetail.text = detail.comicDescription
        comicPublished.text = detail.publishedDate
        setUpAuthorsView(creators: detail.comicCreators)
        globalComicDetail = detail
    }
    
    func setUpAuthorsView(creators: [ComicCreator]) {
        let viewWidth = authorsStackView.frame.origin.x
        let viewHeight = authorsStackView.frame.origin.y
        for creator in creators {
            var totalHeigth = 0
            let creatorLabel = UILabel(frame: CGRect(x: CGFloat(0), y: CGFloat(totalHeigth), width: viewWidth, height: CGFloat(Int(viewHeight) / creators.count)  ))
            creatorLabel.text = "\(creator.creatorName) - (\(creator.creatorRole))"
            creatorLabel.textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            creatorLabel.numberOfLines = 0
            creatorLabel.font = UIFont(name: "Avenir Next", size: 14.0)
            creatorLabel.textAlignment = .left
            authorsStackView.addArrangedSubview(creatorLabel)
            totalHeigth += Int(viewHeight) / creators.count
        }
    }
    
    @IBAction func insertFavorite(_ sender: UIBarButtonItem) {
        let insertAlert = UIAlertController(title: "Alert", message: "Are you willing to save this comic on your favorite comic list?", preferredStyle: UIAlertControllerStyle.alert)
        
        insertAlert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { (action: UIAlertAction!) in
            self.saveComic()
        }))
        
        insertAlert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: { (action: UIAlertAction!) in
            return
        }))
        self.present(insertAlert, animated: true, completion: nil)
    }
    
    func saveComic() {
        let data = globalComicDetail
        let authorsData = globalComicDetail.comicCreators
        let comic = ComicData(entity: ComicData.entity(), insertInto: context)
        comic.comicTitle = data?.comicTitle
        comic.comicDescription = data?.comicDescription
        comic.publishedDate = data?.publishedDate
        comic.comicImage = UIImagePNGRepresentation(data!.comicImage) as NSData?
        for authorData in authorsData {
            let author = ComicAuthor(entity: ComicAuthor.entity(), insertInto: self.context)
            author.name = authorData.creatorName
            author.role = authorData.creatorRole
            author.comic = comic
        }
        appDelegate.saveContext()
    }
}
