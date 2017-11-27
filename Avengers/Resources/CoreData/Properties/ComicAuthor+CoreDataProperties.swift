//
//  ComicAuthor+CoreDataProperties.swift
//  Avengers
//
//  Created by Sebastian on 11/27/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//
//

import Foundation
import CoreData


extension ComicAuthor {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ComicAuthor> {
        return NSFetchRequest<ComicAuthor>(entityName: "ComicAuthor")
    }

    @NSManaged public var name: String?
    @NSManaged public var role: String?
    @NSManaged public var comic: ComicData?

}
