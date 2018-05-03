//
//  LeagueVC.swift
//  Swoosh
//
//  Created by Alish Giri on 5/3/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

class LeagueVC: UIViewController {
    
    var player: Player!
    
    @IBOutlet weak var btnNextOutlet: BorderButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        player = Player()
    }
    
    @IBAction func btnNextAction(_ sender: Any) {
        performSegue(withIdentifier: "goToSkillView", sender: nil)
    }
    
    @IBAction func btnMensAction(_ sender: Any) {
        selected(desiredLeague: "mens")
    }
    
    @IBAction func btnWomensAction(_ sender: Any) {
        selected(desiredLeague: "womens")
    }
    
    @IBAction func btnCoedAction(_ sender: Any) {
        selected(desiredLeague: "coed")
    }
    
    func selected(desiredLeague: String) {
        player.desiredLeague = desiredLeague
        btnNextOutlet.isEnabled = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let skillVC = segue.destination as? SkillVC {
            skillVC.player = player
        }
    }
    
}
