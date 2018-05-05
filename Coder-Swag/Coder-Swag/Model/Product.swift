//
//  Product.swift
//  Coder-Swag
//
//  Created by Alish Giri on 5/5/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import Foundation

struct Product {
    private(set) public var title: String!
    private(set) public var category: String!
    private(set) public var price: String!
    private(set) public var imageName: String!
    
    
    init(title: String, category: String, price: String, imageName: String) {
        self.title = title
        self.category = category
        self.price = price
        self.imageName = imageName
    }
}
