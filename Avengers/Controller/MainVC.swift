//
//  MainVC.swift
//  Spiderman
//
//  Created by Sebastian on 11/24/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import UIKit

class MainVC: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    //MARK: Outlets
    @IBOutlet weak var heroTableView: UITableView!
    @IBOutlet weak var favoritesButton: UIButton!
    
    var isConnected = Reachability.isConnectedToNetwork()
    var objectBuilder: ObjectBuilder = ObjectBuilder()
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavbarTitleImage(imageName: "avengers-logo")
        updateUserInterface()
        heroTableView.dataSource = self
        heroTableView.delegate = self
    }

    //MARK: TableView protocol implementation
    //Table view size
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return HeroDefaultData.instance.getHeroes().count
    }
    
    //Table view data population
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "HeroCell") as? HeroCell {
            let hero = HeroDefaultData.instance.getHeroes()[indexPath.row]
            cell.updateViews(hero: hero)
            return cell
        } else {
            return HeroCell()
        }
    }
    
    //Table view actions
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if isConnected {
            performSegue(withIdentifier: "HeroVC", sender: HeroDefaultData.instance.getHeroes()[indexPath.row])
        } else {
            self.present(objectBuilder.offlineAlert(), animated: true, completion: nil)
        }
    }
    
    //Segue to comicVC
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let comicVC = segue.destination as? ComicVC {
            let barBtn = UIBarButtonItem()
            barBtn.title = ""
            navigationItem.backBarButtonItem = barBtn
            comicVC.initSection(hero: sender as! Hero)
        }
    }
    
    func setNavbarTitleImage(imageName: String) {
        let logo = UIImage(named: imageName)
        let imageView = UIImageView(image: logo)
        imageView.contentMode = .scaleAspectFit
        self.navigationItem.titleView = imageView
    }
    
    func updateUserInterface() {
        self.navigationController?.navigationBar.barTintColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
    }
    
    @IBAction func favoritesButtonTapped(_ sender: UIButton) {
        performSegue(withIdentifier: "FavoriteListVCSegue", sender: self)
    }
}
