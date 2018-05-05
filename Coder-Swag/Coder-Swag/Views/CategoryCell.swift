//
//  CategoryCell.swift
//  Coder-Swag
//
//  Created by Alish Giri on 5/5/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    @IBOutlet weak var categoryImage: UIImageView!
    @IBOutlet weak var categoryTitle: UILabel!

 
    func updateViews(category: Category) {
        categoryImage.image = UIImage(named: category.imageName)
        categoryTitle.text = category.title
    }

}
