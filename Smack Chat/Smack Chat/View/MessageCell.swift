//
//  MessageCell.swift
//  Smack Chat
//
//  Created by Mac on 5/15/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

class MessageCell: UITableViewCell {
    
    @IBOutlet weak var imgUser: CircleImage!
    @IBOutlet weak var lblUsername: UILabel!
    @IBOutlet weak var lblTimestamp: UILabel!
    @IBOutlet weak var lblMessageBody: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func configureCell(message: Message) {
        lblMessageBody.text = message.message
        lblUsername.text = message.userName
        imgUser.image = UIImage(named: message.userAvatar)
        imgUser.backgroundColor = UserDataService.instance.returnUIColor(components: message.userAvatarColor)
    }

}
