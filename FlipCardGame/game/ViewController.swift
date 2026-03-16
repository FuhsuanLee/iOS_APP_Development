//
//  ViewController.swift
//  game
//
//  Created by Sherry Lee on 2026/3/16.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var flip: UILabel!
    
    var Count: Int = 0{
        didSet{
            //flipCountLabel.text = "Flips: \(flipCount)"
            updateFlipCountLabel()
        }
    }
    
    @IBAction func btn1(_ sender: UIButton) {
        if sender.currentTitle == "🍐" {
            sender.setTitle("", for: UIControl.State.normal)
                sender.backgroundColor = #colorLiteral(red: 0.6672183871, green: 0.8040646315, blue: 0.8617751002, alpha: 1)
        } else {
            sender.setTitle("🍐", for: UIControl.State.normal)
                sender.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            }
            Count += 1
    }
    
    @IBAction func btn2(_ sender: UIButton) {
        if sender.currentTitle == "🩰" {
            sender.setTitle("", for: UIControl.State.normal)
                sender.backgroundColor = #colorLiteral(red: 0.6672183871, green: 0.8040646315, blue: 0.8617751002, alpha: 1)
        } else {
            sender.setTitle("🩰", for: UIControl.State.normal)
                sender.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
                }
                Count += 1
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
