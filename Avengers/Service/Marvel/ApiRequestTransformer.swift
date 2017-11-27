//
//  Request.swift
//  Spiderman
//
//  Created by Sebastian on 11/24/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ApiRequestTransformer {
    
    var marvelApi: MarvelApi = MarvelApi()
    var formatter: Formatter = Formatter()
    var objectBuilder: ObjectBuilder = ObjectBuilder()
    
    func comicRequest(forHero hero: Hero, completionHandler: @escaping ([Comic]) -> () ) {
        
        Alamofire.request(RequestUrlBuilder.sectionByHeroUrl(urlToBuild: marvelApi, forHero: hero)).responseJSON {
            (response) in
            var comics = [Comic]()
            if response.result.isSuccess {
                let marvelJSON : JSON = JSON(response.result.value!)
                let results = marvelJSON["data"]["results"]
                for(_, result) in results {
                    let comicImageUrl = "\(self.formatter.urlNormalizer(url: result["thumbnail"]["path"].stringValue)).\(result["thumbnail"]["extension"])"
                    comics.append(Comic.init(
                        imageUrl: comicImageUrl,
                        title: result["title"].stringValue,
                        issueNumber: result["issueNumber"].stringValue,
                        pages: result["pageCount"].stringValue,
                        price: result["prices"][0]["price"].stringValue,
                        comicURL: self.formatter.urlNormalizer(url: result["resourceURI"].stringValue)))
                                  
                }
                completionHandler(comics)
            } else {
                fatalError("An error ocurred while obtaining the Comic list data")
            }
        }
    }
    
    func comicRequestByComicId(forComic comic: Comic, completionHandler: @escaping (ComicDetail) -> ()) {
        Alamofire.request(RequestUrlBuilder.sectionByComicUrl(urlToBuild: marvelApi, forComicId: comic)).responseJSON {
            response in            
            if response.result.isSuccess {
                let detailJSON : JSON = JSON(response.result.value!)["data"]["results"][0]
                let comicCreator = self.objectBuilder.comicCreatorObject(forCreators: detailJSON["creators"]["items"])
                let detail : ComicDetail = ComicDetail(
                        comicTitle: comic.title,
                        comicImage: comic.image,
                        publishedDate: detailJSON["dates"][0]["date"].stringValue,
                        comicCreators: comicCreator,
                        comicDescription: detailJSON["description"].stringValue)
                completionHandler(detail)
            } else {
                fatalError("An error ocurred while trying to obtain the Comic Detail data")
            }
        }
    }

}


