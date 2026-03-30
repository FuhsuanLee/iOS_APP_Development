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
    
    let emojiChoices = ["🥨","🍐","🍊","🧃"]
    
    lazy var game: MatchingGame = MatchingGame(numberOfPairsCards: (cardButtons.count+1/2))
    
    var Count: Int = 0{
        didSet{
            //flipCountLabel.text = "Flips: \(flipCount)"
            updateFlipCountLabel()
        }
    }
    
    func getEmoji(at index:Int) -> String {
        if index < emojiChoices.count {
            title = emojiChoices[index]
        } else {
            title = "?"
        }
        return title ?? "?"
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
                button.setTitle(getEmoji(at: index), for: UIControl.State.normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
        }
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        if let index = cardButtons.firstIndex(of: sender){
            let selectCard = game.chooseCard(at: index)
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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
