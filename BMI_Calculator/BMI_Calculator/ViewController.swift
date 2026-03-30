//
//  ViewController.swift
//  0302
//
//  Created by Sherry Lee on 2026/3/2.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var Label: UILabel!
    @IBOutlet weak var Sherry: UILabel!
    
    @IBOutlet weak var btn1: UIButton!
    @IBAction func btn(_ sender: Any) {
        let result = ["Sad Sherry", "Happy Sherry", "Angry Sherry", "Bored Sherry"]
        Sherry.text = result.randomElement()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn1.layer.borderColor = UIColor(red: 180/255, green: 140/255, blue: 60/255, alpha: 1).cgColor
        // Do any additional setup after loading the view.
    }

}
