//
//  ViewController.swift
//  ThreeCardMonte
//
//  Created by Alex Paul on 11/5/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    //Giving the winning number a default value
    var winningNumber = 0
    @IBOutlet weak var textLabel: UILabel!
    //outlet collection is just an array of the type of object you're making it from. so in this case, it is an array of uibuttons
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //run my setup function to begin
        setup()
    }
    
    //setting up the game with the winning number, correct label, and enabling my buttons
    private func setup() {
        winningNumber = Int.random(in: 0...2)
        textLabel.text = "Pick A Card"
        for button in buttons {
            button.isEnabled = true
            button.setImage(UIImage.init(named: "cardBackRed"), for: .normal)
        }
    }
    
    //whenever a button gets pressed, the tag gets compared to the winning number and sets things accordingly
    @IBAction func cardFlip(_ sender: UIButton) {
        if sender.tag == self.winningNumber {
            sender.setImage(UIImage.init(named: "kingCard"), for: .normal)
            textLabel.text = "You Win!"
        } else {
            sender.setImage(UIImage.init(named: "threeCard"), for: .normal)
            textLabel.text = "You Lose!"
        }
        for button in buttons {
            button.isEnabled = false
        }
    }
    
    //restarting is simply the intial set up
    @IBAction func restart(_ sender: UIButton) {
        setup()
    }
}

