//
//  ViewController.swift
//  Swoosh
//
//  Created by Alish Giri on 5/3/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {
    
    @IBOutlet weak var imgSwooshLogo: UIImageView!
    @IBOutlet weak var imgBackground: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // SETTING UP CONSTRAINTS PROGRMATICALLY WHICH IS NOT IDEAL
        // USE AUTO LAYOUT FOR AUTO LAYOUT
        /*
         imgSwooshLogo.frame = CGRect(x: view.frame.size.width / 2 - imgSwooshLogo.frame.size.width / 2, y: 25, width: imgSwooshLogo.frame.size.width, height: imgSwooshLogo.frame.size.height)
        imgBackground.frame = view.frame
         */
    }
    
    @IBAction func unwindFromLeagueVC(unwindSegue: UIStoryboardSegue) {
        
    }



}

