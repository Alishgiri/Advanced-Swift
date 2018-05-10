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
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    
    var avatarName =  "profileDefault"
    var avatarColor = "[0.5, 0.5, 0.5, 1]"
    var bgColor: UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    override func viewDidAppear(_ animated: Bool) {
        if UserDataService.instance.avatarName != "" {
            imgUser.image = UIImage(named: UserDataService.instance.avatarName)
            avatarName = UserDataService.instance.avatarName
            
            if avatarName.contains("light") && bgColor == nil {
                imgUser.backgroundColor = UIColor.gray
            }
        }
    }
    
    @IBAction func btnClose(_ sender: UIButton) {
        performSegue(withIdentifier: UNWIND, sender: nil)
    }
    
    @IBAction func btnChooseAvatar(_ sender: UIButton) {
        performSegue(withIdentifier: TO_AVATAR_PICKER, sender: nil)
    }
    
    @IBAction func btnGenerateBG(_ sender: UIButton) {
        let r = CGFloat(arc4random_uniform(255))  / 255
        let g = CGFloat(arc4random_uniform(255))  / 255
        let b = CGFloat(arc4random_uniform(255))  / 255

        bgColor = UIColor(red: r, green: g, blue: b, alpha: 1)
        avatarColor = "[\(r),\(g),\(b)]"
        UIView.animate(withDuration: 0.2) {
            self.imgUser.backgroundColor = self.bgColor
        }
        
    }
    
    // SETTING UP PLACEHOLDER COLOR
    func setupView() {
        spinner.isHidden = true
        fldUsername.attributedPlaceholder = NSAttributedString(string: "username", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        fldEmail.attributedPlaceholder = NSAttributedString(string: "email", attributes: [NSAttributedStringKey.foregroundColor: smackPurplePlaceholder])
        fldPassword.attributedPlaceholder = NSAttributedString(string: "password", attributes: [NSAttributedStringKey.foregroundColor : smackPurplePlaceholder])
        
        // HIDE KEYBOARD
        let tap = UITapGestureRecognizer(target: self, action: #selector(CreateAccountVC.handleTap))
        view.addGestureRecognizer(tap)
    }
    
    @objc func handleTap() {
        view.endEditing(true)
    }
    
    @IBAction func btnCreateAccount(_ sender: UIButton) {
        spinner.isHidden = false
        spinner.startAnimating()
        guard let name = fldUsername.text else { return }
        guard let email = fldEmail.text else { return }
        guard let pass = fldPassword.text else { return }
        
        AuthService.instance.registerUser(email: email, password: pass) { (success) in
            if success {
                AuthService.instance.loginUser(email: email, password: pass, completion: { (success) in
                    if success {
                        AuthService.instance.createUser(name: name, email: email, avatarName: self.avatarName, avatarColor: self.avatarColor, completion: { (success) in
                            if success {
                                self.spinner.isHidden = true
                                self.spinner.stopAnimating()
                                self.performSegue(withIdentifier: UNWIND, sender: nil)
                                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
                            }
                        })
                    }
                })
            }
        }
    }
    
}
