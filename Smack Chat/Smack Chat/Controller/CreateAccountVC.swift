//
//  CreateAccountVC.swift
//  Smack Chat
//
//  Created by Alish Giri on 5/7/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnClose(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
        
}
