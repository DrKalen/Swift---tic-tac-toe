//
//  ViewController.swift
//  tictactoe2
//
//  Created by Kalen Hammann on 12/13/18.
//  Copyright © 2018 Human Family. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var whoseTurnLabel: UILabel!
    
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    
    @IBAction func button(_ sender: UIButton) {
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 {
            gameState[activePosition] = activePlayer
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
            } else {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }
        }
        
        
        print(sender.tag)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }


}

