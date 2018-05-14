//
//  Channel.swift
//  Smack Chat
//
//  Created by Alish Giri on 5/6/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

class ChannelVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var btnLoginOutlet: UIButton!
    @IBOutlet weak var imgUserImage: UIImageView!
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {}
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
        
        NotificationCenter.default.addObserver(self, selector: #selector(ChannelVC.userDataDidChanged(_:)), name: NOTIF_USER_DATA_DID_CHANGE, object: nil)

        SocketService.instance.getChannnel { (success) in
            if success {
                self.tableView.reloadData()
            }
        }
    }
    override func viewDidAppear(_ animated: Bool) {
        setupUserInfo()
    }
    
    
    @objc func userDataDidChanged(_ notify: Notification) {
        setupUserInfo()
    }
    @IBAction func btnAddChannel(_ sender: Any) {
        let addChannel = AddChannelVC()
        addChannel.modalPresentationStyle = .custom
        present(addChannel, animated: true, completion: nil)
    }
    
    @IBAction func btnLogin(_ sender: UIButton) {
        if AuthService.instance.isLoggedIn {
            let profile = ProfileVC()
            profile.modalPresentationStyle = .custom
            present(profile, animated: true, completion: nil)
        } else {
            performSegue(withIdentifier: TO_LOGIN, sender: nil)
        }
        
    }
    
    func setupUserInfo() {
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
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "channelCell", for: indexPath) as? ChannelCell {
            let channel = MessageService.instance.channels[indexPath.row]
            cell.configureCell(channel: channel)
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return MessageService.instance.channels.count
    }
}
