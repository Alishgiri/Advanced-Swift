//
//  CreateAccountVC.swift
//  Smack Chat
//
//  Created by Alish Giri on 5/7/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

class CreateAccountVC: UIViewController {
    
    @IBOutlet weak var fldUsername: UITextField!
    @IBOutlet weak var fldEmail: UITextField!
    @IBOutlet weak var fldPassword: UITextField!
    @IBOutlet weak var imgUser: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnClose(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func btnChooseAvatar(_ sender: UIButton) {
    }
    
    @IBAction func btnGenerateBG(_ sender: UIButton) {
    }
    
    @IBAction func btnCreateAccount(_ sender: UIButton) {
        guard let email = fldEmail.text else { return }
        guard let pass = fldPassword.text else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        print("logged in user!", AuthService.instance.authToken)
                    }
                })
            }
        }
    }
    
}
