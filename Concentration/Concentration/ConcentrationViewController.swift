//
//  ViewController.swift
//  Concentration
//
//  Created by Alish Giri on 5/19/18.
//  Copyright © 2018 Alish Giri. All rights reserved.
//

import UIKit

class ConcentrationViewController: UIViewController {
    
    @IBOutlet private weak var lblFlipCount: UILabel! {
        didSet {
            updateFlipCountLabel()
        }
    }
    @IBOutlet private var btnCardOutletCollection: [UIButton]!
    
    private var visibleCardButtons: [UIButton]! {
        return btnCardOutletCollection?.filter { !$0.superview!.isHidden}
    }
    
    private lazy var game = Concentration(numberOfPairsOfCards: numberOfPairsOfCards)
    
    var numberOfPairsOfCards: Int {
        return (visibleCardButtons.count + 1) / 2
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        updateViewFromModel()
    }
    
    private(set) var flipCount = 0 {
        // didSet IS A PROPERTY OBSERVER
        didSet { // EVERY TIME flipCount VALUE CHANGES THIS FUNC WILL BE CALLED
            updateFlipCountLabel()
        }
    }
    
    private func updateFlipCountLabel() {
        let attributes: [NSAttributedStringKey: Any] = [
            .strokeWidth : 5.0,
            .strokeColor : UIColor.black
        ]
        let attributedString = NSAttributedString(
            string: traitCollection.verticalSizeClass == .compact ? "Flips\n\(flipCount)" : "Flips \(flipCount)",
            attributes: attributes)
        lblFlipCount.attributedText = attributedString
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)
        updateFlipCountLabel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func btnCard(_ sender: UIButton) {
        if let cardNumber = visibleCardButtons.index(of: sender) {
            if !game.cards[cardNumber].isMatched {
                flipCount += 1
            }
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        
    }
    
    private func updateViewFromModel() {
        if visibleCardButtons != nil {
            for index in visibleCardButtons.indices {
                let button = visibleCardButtons[index]
                let card = game.cards[index]
                if card.isFaceUp {
                    button.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
                    button.setTitle(emoji(for: card), for: [])
                } else {
                    button.setTitle("", for: [])
                    button.backgroundColor = card.isMatched ?  #colorLiteral(red: 1, green: 0.5763723254, blue: 0, alpha: 0) : #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
                }
            }
        }
    }
    
    var theme: String? {
        didSet {
            emojiChoices = theme ?? ""
            emoji = [:]
            updateViewFromModel()
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
