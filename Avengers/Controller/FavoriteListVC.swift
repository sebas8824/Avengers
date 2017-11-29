//
//  FavoriteListVC.swift
//  Avengers
//
//  Created by Sebastian on 11/27/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import UIKit

class FavoriteListVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    
    @IBOutlet weak var favoritesCollectionList: UICollectionView!
    
    private var appDelegate = UIApplication.shared.delegate as! AppDelegate
    private let context = (UIApplication.shared.delegate as! AppDelegate).persistenceContainer.viewContext
    var comicsTotal = [ComicData]()
    var objectBuilder: ObjectBuilder = ObjectBuilder()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        favoritesCollectionList.delegate = self
        favoritesCollectionList.dataSource = self
        retrieveFavorites()
        if comicsTotal.isEmpty {
            let alert = objectBuilder.alertBuilder(forTitle: "Favorite comics", forMessage: "Please select heroes, check their comics and add some to your favorites list", forActions: nil)
            self.present(alert, animated: false, completion: nil)
            self.navigationController?.backToViewController(vc: MainVC.self)
        }
    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return comicsTotal.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        if let cell =
        collectionView.dequeueReusableCell(withReuseIdentifier: "FavoriteItemCell", for: indexPath) as? FavoriteItemCell {
            let detail = comicsTotal[indexPath.row]
            cell.updateViews(comic: detail)
            return cell
        } else {
            return UICollectionViewCell()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: "FavoriteDetailSegue", sender: comicsTotal[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let favoriteDetailVC = segue.destination as? FavoriteDetailsVC {
            let barBtn = UIBarButtonItem()
            barBtn.title = ""
            navigationItem.backBarButtonItem = barBtn
            favoriteDetailVC.initSection(comicDetail: sender as! ComicData)
        }
    }
    
    func retrieveFavorites() {
        do {
            comicsTotal = try context.fetch(ComicData.fetchRequest())
        } catch let error as NSError {
            fatalError("An error ocurred while trying to fetch data of ComicData. Detail: \(error), \(error.userInfo) ")
        }
    }
}
