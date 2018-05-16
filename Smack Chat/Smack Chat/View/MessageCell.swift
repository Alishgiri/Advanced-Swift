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
        
        // 2017-07-13T21:49:25.590Z
        guard var isoDate = message.timeStamp else { return }
        let end = isoDate.index(isoDate.endIndex, offsetBy: -5) // cut 5 characteres starting from end index
        isoDate = String(isoDate[..<end])
        
        let isoFormatter = ISO8601DateFormatter()
        let chatDate = isoFormatter.date(from: isoDate.appending("Z"))
        
        let newFormatter = DateFormatter()
        newFormatter.dateFormat = "MMM d, h:mm a"
        
        if let finalDate = chatDate {
            let finalDate = newFormatter.string(from: finalDate)
            lblTimestamp.text = finalDate
        }
    }

}
