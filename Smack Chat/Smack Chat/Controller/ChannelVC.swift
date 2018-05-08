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
    
    @IBAction func prepareForUnwind(segue: UIStoryboardSegue) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.revealViewController().rearViewRevealWidth = self.view.frame.size.width - 60
    }

    @IBAction func btnLogin(_ sender: UIButton) {
        performSegue(withIdentifier: TO_LOGIN, sender: nil)
    }

    
}
