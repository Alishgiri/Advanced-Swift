//
//  ViewController.swift
//  Window-shopper
//
//  Created by Alish Giri on 5/4/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

class MainVC: UIViewController {
    
    
    @IBOutlet weak var fldWage: CurrencyTxtField!
    @IBOutlet weak var fldItemPrice: CurrencyTxtField!
    
    @IBOutlet weak var lblResult: UILabel!
    @IBOutlet weak var lblHours: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let btnCalc = UIButton(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
        btnCalc.backgroundColor = #colorLiteral(red: 0.9254902005, green: 0.2352941185, blue: 0.1019607857, alpha: 1)
        btnCalc.setTitle("Calculate", for: [])
        btnCalc.setTitleColor(#colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0), for: [])
        btnCalc.addTarget(self, action: #selector(MainVC.calculate), for: .touchUpInside)
        
        // inputAccessoryView WILL BRING UP btnCalc WHEN fldWage TEXTFIELD BECOMES THE FIRST RESPONDER
        fldWage.inputAccessoryView = btnCalc
        fldItemPrice.inputAccessoryView = btnCalc
        
        lblResult.isHidden = true
        lblHours.isHidden = true
        
    }
    
    @objc func calculate() {
        if let wageTxt = fldWage.text, let ItemPriceTxt = fldItemPrice.text {
            if let wage = Double(wageTxt), let ItemPrice = Double(ItemPriceTxt) {
                view.endEditing(true)
                lblResult.isHidden = false
                lblHours.isHidden = false
                
                let result = Wage.getHours(forWage: wage, andPrice: ItemPrice)
                lblResult.text = String(result)
            }
        }
    }
    
    @IBAction func btnClearCalc(_ sender: UIButton) {
        lblResult.isHidden = true
        lblHours.isHidden = true
        fldWage.text?.removeAll()
        fldItemPrice.text?.removeAll()
    }


}

