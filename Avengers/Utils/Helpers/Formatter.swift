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
}
