//
//  Wage.swift
//  Window-shopper
//
//  Created by Alish Giri on 5/5/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import Foundation

class Wage {
    // USING class IN FRONT OF A func:
    // THIS ALLOWS YOU USE THIS FUNCTION WITHOUT CREATING AN INSTANCE BUT TO THE CLASS IISELF
    // CALLING A FUNCTION TO THE CLASS ITSELF
    // CAPITAL 'W' -> Wage.getHours(
    class func getHours(forWage wage: Double, andPrice price: Double) -> Int {
         return Int(ceil(price / wage))
    }
}
