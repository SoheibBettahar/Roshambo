//
//  PlayViewController.swift
//  Roshambo
//
//  Created by Soheib on 6/11/2023.
//

import UIKit

class PlayGameViewController: UIViewController {
    
    var gameHistory: [Game] = [Game]()
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier == "showGameResult"){
            let destination = segue.destination as! GameResultViewController
            let userHand = Hand(rawValue: (sender as! UIButton).tag)!
            let game = playGame(userHand: userHand)
            gameHistory.append(game)
            destination.game = game
        }
        
        if(segue.identifier == "showGameHistory"){
            print("navigating to showGameHistory: \(gameHistory.count)")
            let destination = segue.destination as! HistoryViewController
            destination.history = gameHistory
        }
        
    }

}



extension PlayGameViewController {
    
    func randomHand() -> Hand{
        let randomValue: Int = Int(arc4random() % 3)
        return Hand(rawValue: randomValue)!
    }
    
    func playGame(userHand: Hand) -> Game{
        let computerHand = randomHand()
        
        return Game(p1: userHand, p2: computerHand)
    }
    
}

