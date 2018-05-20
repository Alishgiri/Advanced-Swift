//
//  ViewController.swift
//  Concentration
//
//  Created by Alish Giri on 5/19/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var lblFlipCount: UILabel!
    @IBOutlet var btnCardOutlet: [UIButton]!
    
    lazy var game = Concentration(numberOfPairsOfCards: (btnCardOutlet.count + 1) / 2)
    
    var flipCount = 0 {
        // didSet IS A PROPERTY OBSERVER
        didSet { // EVERY TIME flipCount VALUE CHANGES THIS FUNC WILL BE CALLED
            lblFlipCount.text = "Flips: \(flipCount)"
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnCard(_ sender: UIButton) {
        flipCount += 1
        if let cardNumber = btnCardOutlet.index(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        
    }
    
    func updateViewFromModel() {
        for index in btnCardOutlet.indices {
            let button = btnCardOutlet[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
                button.setTitle(emoji(for: card), for: [])
            } else {
                button.setTitle("", for: [])
                button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 1)
            }
        }
    }
    
    var emojiChoices = ["👻", "🎃", "🍎", "🦇", "😱", "🕷", "🍭", "👺", "🧛🏻‍♂️"]
    var emoji = [Int: String]()
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
    
}

