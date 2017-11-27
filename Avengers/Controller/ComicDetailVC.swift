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
    
    //
    private var fetchedRC: NSFetchedResultsController<ComicAuthor>!
    
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
        let data = globalComicDetail
        let authorsData = globalComicDetail.comicCreators
        let comic = ComicData(entity: ComicData.entity(), insertInto: context)
        comic.comicTitle = data?.comicTitle
        comic.comicDescription = data?.comicDescription
        comic.publishedDate = data?.publishedDate
        comic.comicImage = UIImagePNGRepresentation(data!.comicImage) as NSData?
        for authorData in authorsData {
            let author = ComicAuthor(entity: ComicAuthor.entity(), insertInto: context)
            author.name = authorData.creatorName
            author.role = authorData.creatorRole
            author.comic = comic
        }
        appDelegate.saveContext()
        // Get last insertion
        do {
            var comicsTotal = [ComicData]()
                comicsTotal = try context.fetch(ComicData.fetchRequest())
            print(comicsTotal[comicsTotal.count-1].authors)
        } catch {
            print("error")
        }

    }
    
    private func requestAuthors(comic: ComicData) {
        let query = ""
        let request = ComicAuthor.fetchRequest() as NSFetchRequest<ComicAuthor>
        if query.isEmpty {
            request.predicate = NSPredicate(format: "comic = %@", comic)
        } else {
            request.predicate = NSPredicate(format: "name CONTAINS[cd] %@ owner = %@", query, comic)
        }
        do {
            fetchedRC = NSFetchedResultsController(fetchRequest: request, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
            try fetchedRC.performFetch()
        } catch let error as NSError {
            print("error")
        }
    }
    
}
