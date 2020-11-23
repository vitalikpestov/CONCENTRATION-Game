//
//  ViewController.swift
//  CONCENTRATION
//
//  Created by Mac on 30.10.2020.
//

import UIKit

class ViewController: UIViewController  {
    
    lazy var game = ConcentrationGame(numberOfPairsOfCards: ((cardButtons.count + 1) / 2))
    
    
        var touches = 0 {
        didSet {
        touchesLabel.text = "Touches: \(touches)"
        }
    }
        
    var emojiChoices = ["👻","🎃","💋","⭐️","🎃","👻","⭐️","💋","⚽️","🍎","🎯","☀️","🎯","🍎","⚽️","⭐️","☀️" ]
    
    @IBOutlet weak var touchesLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        touches += 1
        if let cardNumbers = cardButtons.firstIndex(of: sender){
            game.choodsCard(at: cardNumbers)
//            updateViewFromModel()
        }
    }
    
    var emojiDictionary = [Int:String]()
    
    func emojiIdentifair(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil {
            let randomIndex = Int (arc4random_uniform(UInt32(emojiChoices.count)))
            emojiDictionary[card.identifier] = emojiChoices.remove(at: randomIndex)
        } else {
        return emojiDictionary[card.identifier] ?? "?"
    }
    
//    let chosenEmoji = emojiDictionary[card.identifier]
    
    
        func flipCard(withEmoji emoji: String, on button: UIButton) {
           
       
            }

    
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if  card.isFaceUp {
                button.setTitle(emojiIdentifair(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
            } else {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 1, blue: 1, alpha: 0) : #colorLiteral(red: 0, green: 0.5898008943, blue: 1, alpha: 1)
        }
    }
    
    }
