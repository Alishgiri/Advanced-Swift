//
//  LoginVC.swift
//  Smack Chat
//
//  Created by Alish Giri on 5/6/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {
    
    @IBOutlet weak var fldEmail: UITextField!
    @IBOutlet weak var fldPassword: UITextField!
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    @IBAction func btnClose(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func btnCreateAccount(_ sender: UIButton) {
        performSegue(withIdentifier: TO_CREATE_ACCOUNT, sender: nil)
    }
    
    @IBAction func btnLogin(_ sender: RoundedButton) {
        spinner.isHidden = false
        spinner.startAnimating()
        
        guard let email = fldEmail.text, fldEmail.text != "" else { return }
        guard let pass = fldPassword.text, fldPassword.text != "" else { return }
        
        AuthService.instance.loginUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.findUserByEmail(completion: { (success) in
                    if success {
                        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                        self.spinner.isHidden = true
                        self.spinner.stopAnimating()
                        self.dismiss(animated: true, completion: nil)
                    }
                })
            }
        }
    }
    
    func setUpView() {
        spinner.isHidden = true
        // Setting and placing a placeholder and its color
        fldEmail.attributedPlaceholder = NSAttributedString(string: "Email", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        fldPassword.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
    }
}
