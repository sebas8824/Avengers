//
//  Formatter.swift
//  Spiderman
//
//  Created by Sebastian on 11/24/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import Foundation

class Formatter {
    func urlNormalizer(url: String) -> String {
        return url.replacingOccurrences(of: "\\/", with: "/")
    }
    
    func dateFormatter(date: String) -> String {
        let regex = try! NSRegularExpression(pattern: "(\\d+)-(\\d+)-(\\d+)T.*", options: NSRegularExpression.Options.caseInsensitive)
        let range = NSMakeRange(0, date.characters.count)
        let year = regex.stringByReplacingMatches(in: date, options: .anchored, range: range, withTemplate: "$1")
        let month = textMonth(month: regex.stringByReplacingMatches(in: date, options: .anchored, range: range, withTemplate: "$2"))
        let day = regex.stringByReplacingMatches(in: date, options: .anchored, range: range, withTemplate: "$3")
        let fullDate = "\(month), \(day), \(year)"
        return fullDate
    }
    
    func textMonth(month: String) -> String {
        var text = ""
        switch month {
        case "01": text = "January"
        case "02": text = "February"
        case "03": text = "March"
        case "04": text = "April"
        case "05": text = "May"
        case "06": text = "June"
        case "07": text = "August"
        case "08": text = "July"
        case "09": text = "September"
        case "10": text = "October"
        case "11": text = "November"
        case "12": text = "December"
        default:
            text = "Unavailable"
        }
        return text
    }

}
