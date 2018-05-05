//
//  CurrencyTxtField.swift
//  Window-shopper
//
//  Created by Alish Giri on 5/5/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

// CHANGES MADE HERE WITH IBDesignable DECOTATOR WILL BE APPLIED TO THE INTERFACE BUILDER (Main.storyboard)
@IBDesignable // THIS WILL REQUIRE prepareForInterfaceBuilder FUNC TO GO WITH IT
class CurrencyTxtField: UITextField {
    
    override func draw(_ rect: CGRect) {
        let size: CGFloat = 20
        let lblCurrency = UILabel(frame: CGRect(x: 5, y: (self.frame.size.height / 2) - (size / 2), width: size, height: size))
        lblCurrency.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        lblCurrency.textAlignment = .center
        lblCurrency.textColor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)
        lblCurrency.layer.cornerRadius = 5.0
        lblCurrency.clipsToBounds = true // THIS IS REQUIRED FOR CornerRadius TO TAKE AFFECT INSIDE draw FUNCITON
        
        let formatter = NumberFormatter()
        formatter.numberStyle = .currency
        formatter.locale = .current // SETTING POSITION -> NOT NECESSARY STEP, IS THER BY DEFAULT
        lblCurrency.text = formatter.currencySymbol
        
        addSubview(lblCurrency)
    }
    
    
    // THIS FUNCTON WLL BE CALLED IN THE INTERFACE BUILDER
    override func prepareForInterfaceBuilder() {
        customizeTextFieldView()
    }
    
    // THIS IS LIKE ViewDidLoad FOR A TEXTFIELD
    override func awakeFromNib() {
        super.awakeFromNib()
        customizeTextFieldView()
    }
    
    func customizeTextFieldView() {
        backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0.25)
        textAlignment = .center
        layer.cornerRadius = 5.0
        
        if let p = placeholder {
            let place = NSAttributedString(string: p, attributes: [.foregroundColor: #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)])
            attributedPlaceholder = place
            textColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        }
    }
    
}
