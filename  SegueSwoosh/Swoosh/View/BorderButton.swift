//
//  BorderButton.swift
//  Swoosh
//
//  Created by Alish Giri on 5/3/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

class BorderButton: UIButton {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    override func awakeFromNib() {
        super.awakeFromNib()
        layer.borderWidth = 2.0
        layer.borderColor = UIColor(red: 234, green: 234, blue: 234, alpha: 0.6).cgColor
    }

}
