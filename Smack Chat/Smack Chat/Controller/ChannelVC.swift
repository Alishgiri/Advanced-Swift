//
//  Channel.swift
//  Smack Chat
//
//  Created by Alish Giri on 5/6/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController {

    @IBOutlet weak var btnLoginOutlet: UIButton!
    @IBOutlet weak var imgUserImage: UIImageView!
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChanged(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)
    }
    
    @objc func userDataDidChanged(_ notify: Notification) {
        if AuthService.instance.isLoggedIn {
            btnLoginOutlet.setTitle(UserDataService.instance.name, for: [])
            imgUserImage.image = UIImage(named: UserDataService.instance.avatarName)
            imgUserImage.backgroundColor = UserDataService.instance.returnUIColor(components: UserDataService.instance.avatarColor)
        } else {
            btnLoginOutlet.setTitle("Login", for: [])
            imgUserImage.image = UIImage(named: "menuProfileIcon")
            imgUserImage.backgroundColor = UIColor.clear
            imgUserImage.clipsToBounds = true
        }
    }

    @IBAction func btnLogin(_ sender: UIButton) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }

    
}
