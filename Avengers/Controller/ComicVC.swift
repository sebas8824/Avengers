//
//  ViewController.swift
//  SpideyComics
//
//  Created by Sebastian on 11/24/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class ComicVC: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var comicTableView: UITableView!
    
    var selectedHero: Hero!
    var heroComicRequest: ApiRequestTransformer = ApiRequestTransformer()
    var objectBuilder: ObjectBuilder = ObjectBuilder()
    var comicsArray = [Comic]()
    var spinner: UIActivityIndicatorView?
    var screenSize = UIScreen.main.bounds
    var isConnected = Reachability.isConnectedToNetwork()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        comicTableView.delegate = self
        comicTableView.dataSource = self
        objectBuilder.addSpinner(forScreenWidth: screenSize.width, forScreenHeight: screenSize.height, forView: comicTableView) { (spin) in
            self.spinner = spin
        }        
        updateUserInterface(hero: selectedHero)
        
        if isConnected {
            heroComicRequest.comicRequest(forHero: selectedHero) {
                response in
                if response.count > 0 {
                    for comic in response {
                        self.objectBuilder.renderImagesFromUrl(url: comic.imageUrl, completionHandler: { (image) in
                            self.comicsArray.append(Comic.init(image: image, comic: comic))
                            self.objectBuilder.removeSpinner(forSpinner: self.spinner!)
                            self.comicTableView?.reloadData()
                        })
                    }
                }
            }
        } else {
            self.present(objectBuilder.offlineAlert(), animated: false)
            self.navigationController?.backToViewController(vc: MainVC.self)
        }
        
    }
    
    func initSection(hero: Hero) {
        selectedHero = hero
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comicsArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "ComicCell") as? ComicCell {
            let comic = comicsArray[indexPath.row]
            cell.updateViews(comic: comic)
            return cell
        } else {
            return ComicCell()
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "ComicDetailVC", sender: comicsArray[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let comicDetailVC = segue.destination as? ComicDetailVC {
            let barBtn = UIBarButtonItem()
            barBtn.title = ""
            navigationItem.backBarButtonItem = barBtn
            comicDetailVC.initComicDetail(comic: sender as! Comic)
        }
    }
    
    func updateUserInterface(hero: Hero) {
        let logo = UIImage(named: hero.logo)
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView        
    }
}

