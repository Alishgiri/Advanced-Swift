//
//  DataService.swift
//  Coder-Swag
//
//  Created by Alish Giri on 5/5/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import Foundation

class DataService {
    // THE BELOW CODE IS GOING TO EVER CREATE ONLY ONE COPY OF THE DataService STORED IN THE MEMORY
    // In software engineering, the singleton pattern is a software design pattern that restricts the instantiation of a class to one object. This is useful when exactly one object is needed to coordinate actions across the system.
    static let instance = DataService() // CREATED A SINGLETON
    
    private let categories = [
        Category.init(title: "SHIRTS", imageName: "shirts.png"),
        Category.init(title: "HOODIES", imageName: "hoodies.png"),
        Category.init(title: "HATS", imageName: "hats.png"),
        Category.init(title: "DIGITAL", imageName: "digital.png"),
        ]
    
    private let shirts = [
        Product.init(title: "Devslopes Logo Graphic", category: "Shirt", price: "$35", imageName: "shirt01"),
        Product.init(title: "Devslopes Logo Graphic", category: "Shirt", price: "$40", imageName: "shirt02"),
        Product.init(title: "Devslopes Logo Graphic", category: "Shirt", price: "$35", imageName: "shirt01"),
        Product.init(title: "Devslopes Logo Graphic", category: "Shirt", price: "$40", imageName: "shirt02"),
        Product.init(title: "Devslopes Logo Graphic", category: "Shirt", price: "$35", imageName: "shirt01"),
        Product.init(title: "Devslopes Logo Graphic", category: "Shirt", price: "$40", imageName: "shirt02"),
        Product.init(title: "Devslopes Logo Graphic", category: "Shirt", price: "$35", imageName: "shirt01"),
        Product.init(title: "Devslopes Logo Graphic", category: "Shirt", price: "$40", imageName: "shirt02")
    ]
    private let hats = [
        Product.init(title: "Devslopes Logo Graphic", category: "Hat", price: "$35", imageName: "hat01"),
        Product.init(title: "Devslopes Logo Graphic", category: "Hat", price: "$40", imageName: "hat02"),
        Product.init(title: "Devslopes Logo Graphic", category: "Hat", price: "$35", imageName: "hat01"),
        Product.init(title: "Devslopes Logo Graphic", category: "Hat", price: "$40", imageName: "hat02")
    ]
    private let hoodies = [
        Product.init(title: "Devslopes Logo Graphic", category: "Hoodie", price: "$35", imageName: "hoodie01"),
        Product.init(title: "Devslopes Logo Graphic", category: "Hoodie", price: "$40", imageName: "hoodie02"),
        Product.init(title: "Devslopes Logo Graphic", category: "Hoodie", price: "$35", imageName: "hoodie03"),
        Product.init(title: "Devslopes Logo Graphic", category: "Hoodie", price: "$40", imageName: "hoodie04")
    ]
    
    private let digitalGoods = [Product]()
    
    func getCategories() -> [Category] {
        return categories
    }
    
    func getProducts(forCategoryTitle title: String) -> [Product] {
        switch title {
        case "SHIRTS":
            return getShirts()
        case "HATS":
            return getHats()
        case "HOODIES":
            return getHoodie()
        case "DIGITAL":
            return getDigitalGoods()
        default:
            return getShirts()
        }
    }
    
    func getShirts() -> [Product] {
        return shirts
    }

    func getHats() -> [Product] {
        return hats
    }
    
    func getHoodie() -> [Product] {
        return hoodies
    }
    
    func getDigitalGoods() -> [Product] {
        return digitalGoods
    }
    
}
