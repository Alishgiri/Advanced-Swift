//
//  Category.swift
//  Coder-Swag
//
//  Created by Alish Giri on 5/5/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import Foundation

struct Category {
    // RESTRICTING ACCESS FROM SETTING THESE VALUE FROM OUTSIDE, ONLY PRIVATE SETTIING AUTHORIZED THUS private(set)
    // BUT DATA STORED HERE CAN BE ACCESSED THOUGHT THE DIFFERENT CONTROLLER THUS public AFTER private(set)
    private(set) public var title: String
    private(set) public var imageName: String
    
    init(title: String, imageName: String) {
        self.title = title
        self.imageName = imageName
    }
}
