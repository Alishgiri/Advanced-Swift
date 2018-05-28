//
//  ViewController.swift
//  Concentration
//
//  Created by Alish Giri on 5/19/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet private weak var lblFlipCount: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    @IBOutlet private var btnCardOutletCollection: [UIButton]!
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
            return (btnCardOutletCollection.count + 1) / 2
        }
    
    private(set) var flipCount = 0 {
        // didSet IS A PROPERTY OBSERVER
        didSet { // EVERY TIME flipCount VALUE CHANGES THIS FUNC WILL BE CALLED
            updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedStringKey:Any] = [
            .strokeWidth : 5.0,
            .strokeColor : UIColor.orange
        ]
        let attributedString = NSAttributedString(string: "Flips \(flipCount)", attributes: attributes)
        lblFlipCount.attributedText = attributedString
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func btnCard(_ sender: UIButton) {
        if let cardNumber = btnCardOutletCollection.index(of: sender) {
            if !game.cards[cardNumber].isMatched {
                flipCount += 1
            }
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        
    }
    
    private func updateViewFromModel() {
        for index in btnCardOutletCollection.indices {
            let button = btnCardOutletCollection[index]
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
    
    //private var emojiChoices = ["👻", "🎃", "🍎", "🦇", "😱", "🕷", "🍭", "👺", "🧛🏻‍♂️"]
    private var emojiChoices = "👻🎃🍎🦇😱🕷🍭👺🧛🏻‍♂️"

    private var emoji = [Card: String]()
    
    private func emoji(for card: Card) -> String {
        if emoji[card] == nil, emojiChoices.count > 0 {
            let randomIndex = emojiChoices.index(emojiChoices.startIndex, offsetBy: emojiChoices.count.arc4random)
            emoji[card] = String(emojiChoices.remove(at: randomIndex))
        }
        return emoji[card] ?? "?"
    }
    
}

extension Int {
    var arc4random: Int {
        if self > 0 {
             return Int(arc4random_uniform(UInt32(self)))
        } else if self < 0 {
            return -Int(arc4random_uniform(UInt32(abs(self))))
        } else {
            return 0
        }
       
    }
}
