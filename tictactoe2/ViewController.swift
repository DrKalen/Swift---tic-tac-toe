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
    
    @IBOutlet weak var winnerLabel: UILabel!
    
    @IBOutlet weak var playAgainButton: UIButton!
    
    var activeGame = true
    var activePlayer = 1
    var gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]         // 0 = empty, 1 = nought, 2 = cross
    var winningCombinations = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    @IBAction func playAgainButton(_ sender: UIButton) {
        activeGame = true
        activePlayer = 1
        gameState = [0, 0, 0, 0, 0, 0, 0, 0, 0]
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
        whoseTurnLabel.text = "O's Turn"
        for i in 1..<10 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: [])
            }
        }
    }
    
    
    
    @IBAction func button(_ sender: UIButton) {
        let activePosition = sender.tag - 1
        
        if gameState[activePosition] == 0 && activeGame {
            gameState[activePosition] = activePlayer
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
                whoseTurnLabel.text = "X's Turn"
            } else {
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
                whoseTurnLabel.text = "O's Turn"
            }
            
            for combination in winningCombinations {
                if gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]] {
                    // we have a winner!
                    activeGame = false
                    winnerLabel.isHidden = false
                    winnerLabel.text = gameState[combination[0]] == 1 ? "O has won!" : "X has won!"
                    playAgainButton.isHidden = false
                    print(gameState[combination[0]])   //  the identity of the winner
                }
            }
        }
        
        
//        print(sender.tag)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        winnerLabel.isHidden = true
        playAgainButton.isHidden = true
    }


}

