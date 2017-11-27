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
}
