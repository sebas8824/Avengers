//
//  ComicData+CoreDataProperties.swift
//  Avengers
//
//  Created by Sebastian on 11/27/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//
//

import Foundation
import CoreData


extension ComicData {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ComicData> {
        return NSFetchRequest<ComicData>(entityName: "ComicData")
    }

    @NSManaged public var comicDescription: String?
    @NSManaged public var comicImage: NSData?
    @NSManaged public var comicTitle: String?
    @NSManaged public var publishedDate: String?
    @NSManaged public var authors: NSSet?

}

// MARK: Generated accessors for authors
extension ComicData {

    @objc(addAuthorsObject:)
    @NSManaged public func addToAuthors(_ value: ComicAuthor)

    @objc(removeAuthorsObject:)
    @NSManaged public func removeFromAuthors(_ value: ComicAuthor)

    @objc(addAuthors:)
    @NSManaged public func addToAuthors(_ values: NSSet)

    @objc(removeAuthors:)
    @NSManaged public func removeFromAuthors(_ values: NSSet)

}
