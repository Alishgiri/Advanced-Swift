//
//  LoginVC.swift
//  Smack Chat
//
//  Created by Alish Giri on 5/6/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnClose(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnCreateAccount(_ sender: UIButton) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
}
