//
//  UINavigationControllerExtension.swift
//  Avengers
//
//  Created by Sebastián Benitez on 11/28/17.
//  Copyright © 2017 Sebastian. All rights reserved.
//

import Foundation
import UIKit

extension UINavigationController {
    
    func backToViewController(vc: Any) {
        for element in viewControllers as Array {
            if "\(type(of: element)).Type" == "\(type(of: vc))" {
                self.popToViewController(element, animated: true)
                break
            }
        }
    }    
}
