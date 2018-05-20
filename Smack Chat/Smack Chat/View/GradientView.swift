//
//  GradientView.swift
//  Smack Chat
//
//  Created by Alish Giri on 5/6/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

@IBDesignable
class GradientView: UIView {
    
    // CUSTOM VARIABLE THAT WE CAN CHANGE CAN BE ACHIVED BY USING @IBInspectable
    // THIS ALLOWS EDITING TO BE DONE FROM Main.Storyboard
    @IBInspectable var topColor: UIColor = #colorLiteral(red: 0.2901960784, green: 0.3019607843, blue: 0.8470588235, alpha: 1) {
        didSet {
            // didSet WILL BE CALLED AFTER THE VALUE OF THIS VARIABLE IS ONCE SET
            // AFTER A VALUE IS SET TO THIS VARIABLE THEN THIS BLOCK OF CODE INSIDE didSet WILL RUN
            self.setNeedsLayout()
        }
    }
    
    @IBInspectable var bottomColor: UIColor = #colorLiteral(red: 0.1725490196, green: 0.831372549, blue: 0.8470588235, alpha: 1) {
        didSet {
            self.setNeedsLayout()
        }
    }
    
    // AFTER setNeedsLayout IS CALLED THE THIS FUNCTION WILLL RUN
    override func layoutSubviews() {
        let gradientLayer = CAGradientLayer()
        gradientLayer.colors = [topColor.cgColor, bottomColor.cgColor]
        gradientLayer.startPoint = CGPoint(x: 0, y: 0)
        gradientLayer.endPoint = CGPoint(x: 1, y: 1)
        gradientLayer.frame = self.bounds // size of the UIView
        self.layer.insertSublayer(gradientLayer, at: 0) // 0 here means first layer
    }
    
    override func prepareForInterfaceBuilder() {
        super.prepareForInterfaceBuilder()
        layoutIfNeeded()
    }
    

}
