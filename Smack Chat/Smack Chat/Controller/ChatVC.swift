//
//  ChatVC.swift
//  Smack Chat
//
//  Created by Alish Giri on 5/6/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

class ChatVC: UIViewController {
    
    @IBOutlet weak var btnMenu: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        btnMenu.addTarget(self.revealViewController(), action: #selector(SWRevealViewController.revealToggle(_:)), for: .touchUpInside)
        self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer()) // SWIPE GESTURE
        self.view.addGestureRecognizer(self.revealViewController().tapGestureRecognizer())
        
        if AuthService.instance.isLoggedIn {
            AuthService.instance.findUserByEmail { (success) in
                NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
            }
        }
        
        MessageService.instance.findAllChannel { (success) in
            
        }
    }

}
