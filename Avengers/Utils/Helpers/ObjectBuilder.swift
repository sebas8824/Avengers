//
//  ObjectBuilder.swift
//  Spiderman
//
//  Created by Sebastian on 11/26/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import Foundation
import SwiftyJSON
import Alamofire
import AlamofireImage
import UIKit

class ObjectBuilder {
    var formatter = Formatter()
    
    func comicCreatorObject(forCreators json: JSON) -> [ComicCreator] {
        var comicCreators = [ComicCreator]()
        for (_, creator) in json {         
            comicCreators.append(ComicCreator.init(creatorName: creator["name"].stringValue, creatorRole: creator["role"].stringValue))
        }
        return comicCreators
    }
    
    func renderImagesFromUrl(url: String, completionHandler: @escaping (UIImage) -> ()) {
        Alamofire.request(url).responseImage(completionHandler: {
            (response) in
            guard let image = response.result.value else { return }
            completionHandler(image)
        })
    }
    
    func alertBuilder(forTitle title: String, forMessage message: String, forActions actions: [UIAlertAction]?) -> UIAlertController {
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertControllerStyle.alert)
        if actions != nil {
            for action in actions! {
                alert.addAction(action)
            }
        } else {
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        }        
        return alert
    }
    
    func offlineAlert() -> UIAlertController {
        let alert = alertBuilder(forTitle: "Offline mode", forMessage: "You are currently without internet connection. The app will continue working, but you only will be able to browse your favorite comic", forActions: nil)
        return alert
    }
    
}
