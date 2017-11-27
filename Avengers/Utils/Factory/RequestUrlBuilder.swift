//
//  RequestUrlBuilder.swift
//  Spiderman
//
//  Created by Sebastian on 11/24/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import Foundation
import SwiftHash

class RequestUrlBuilder {
    static func sectionByHeroUrl(urlToBuild urlObject: MarvelApi, forHero hero: Hero) -> String {
        let ts = Int(NSDate().timeIntervalSince1970.rounded())
        let hash = MD5("\(ts)\(urlObject.privateKey)\(urlObject.publicKey)").lowercased()
        let url = "\(urlObject.gatewayUrl)v1/public/characters/\(hero.heroId)/comics?apikey=\(urlObject.publicKey)&hash=\(hash)&ts=\(ts)&limit=\(urlObject.limit)&format=comic&formatType=comic"
        return url
    }
    
    static func sectionByComicUrl(urlToBuild urlObject: MarvelApi, forComicId comic: Comic) -> String {
        let ts = Int(NSDate().timeIntervalSince1970.rounded())
        let hash = MD5("\(ts)\(urlObject.privateKey)\(urlObject.publicKey)").lowercased()
        let url = "\(comic.comicURL)?apikey=\(urlObject.publicKey)&hash=\(hash)&ts=\(ts)"
        return url
    }
    
    static func getCharacterDataByComicId(urlToBuild urlObject: MarvelApi, forComicUrl url: String) -> String {
        let ts = Int(NSDate().timeIntervalSince1970.rounded())
        let hash = MD5("\(ts)\(urlObject.privateKey)\(urlObject.publicKey)").lowercased()
        let url = "\(url)?apikey=\(urlObject.publicKey)&hash=\(hash)&ts=\(ts)"
        return url
    }
}
