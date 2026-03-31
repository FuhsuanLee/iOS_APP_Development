//
//  ViewController.swift
//  game
//
//  Created by Sherry Lee on 2026/3/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flip: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    var emojiChoices = ["🥨","🍐","🍊","🧃"]
    
    lazy var game: MatchingGame = MatchingGame(numberOfPairsCards: (cardButtons.count+1/2))
    
    var Count: Int = 0{
        didSet{
            //flipCountLabel.text = "Flips: \(flipCount)"
            updateFlipCountLabel()
        }
    }
    
    var emojiDictionary = Dictionary<Int, String>()
    
    func getEmoji(for card: Card) -> String {
        if emojiDictionary[card.identifier] == nil, emojiChoices.count > 0 {
            let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
            
            emojiDictionary[card.identifier] = emojiChoices.remove(at: randomIndex)
            
        }
        return emojiDictionary[card.identifier] ?? "?"
    }
    
    //let title = getEmoji(for: card)
    
    func updateViewFromModel(){
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            
            if !card.isFaceUp {
                button.setTitle("", for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 0.6672183871, green: 0.8040646315, blue: 0.8617751002, alpha: 1)
            } else {
                button.setTitle(getEmoji(for: card), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
        }
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        if let index = cardButtons.firstIndex(of: sender){
            _ = game.chooseCard(at: index)
            updateViewFromModel()
            Count += 1
        } else {
            print("Not in Collection")
        }
    }
    
    private func updateFlipCountLabel(){
        let flipAttributes: [NSAttributedString.Key : Any] = [
            .font: UIFont.systemFont(ofSize: 40),
            .strokeColor : UIColor.darkGray,
            .strokeWidth : -3.0,
            .foregroundColor : UIColor.darkGray
        ]

        let attribtext = NSAttributedString(
            string: "Flips: \(Count)",
            attributes: flipAttributes
        )

        flip.attributedText = attribtext
    }
    
    @IBAction func resetGame(_ sender: Any) {
        game = MatchingGame(numberOfPairsCards: cardButtons.count / 2)

        emojiChoices = ["🥨","🍐","🍊","🧃"]
        emojiDictionary.removeAll()
        
        Count = 0
        
        updateViewFromModel()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
