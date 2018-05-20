//
//  ProfileVC.swift
//  Smack Chat
//
//  Created by Mac on 5/10/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {

    @IBOutlet weak var imgProfile: UIImageView!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblEmail: UILabel!
    @IBOutlet weak var bgView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }

    @IBAction func btnClose(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }

    @IBAction func btnLogout(_ sender: UIButton) {
        UserDataService.instance.logoutUser()
        NotificationCenter.default.post(name: NOTIF_USER_DATA_DID_CHANGE, object: nil) // SEND NOTIFICATION BROADCAST TO LISTENING CONTROLLER
        dismiss(animated: true, completion: nil)
    }
    
    func setUpView() {
        let data = UserDataService.instance
        imgProfile.image = UIImage(named: data.avatarName)
        lblUsername.text = data.name
        lblEmail.text = data.email
        imgProfile.backgroundColor = data.returnUIColor(components: data.avatarColor)
        
        let touchClose = UITapGestureRecognizer(target: self, action: #selector(ProfileVC.closeOnTouch(_:)))
        bgView.addGestureRecognizer(touchClose)
    }
    
    @objc func closeOnTouch(_ recognizer: UITapGestureRecognizer) {
        dismiss(animated: true, completion: nil)
    }
    
}
