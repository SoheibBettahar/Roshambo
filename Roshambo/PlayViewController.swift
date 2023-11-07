//
//  PlayViewController.swift
//  Roshambo
//
//  Created by Soheib on 6/11/2023.
//

import UIKit

class PlayViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func playRock(_ sender: Any) {
        let controller: ResponseViewController
        controller = storyboard?.instantiateViewController(withIdentifier: "ResponseViewController") as! ResponseViewController
        
        let userHand = Hand(rawValue: (sender as! UIButton).tag)!
        controller.game = playGame(userHand: userHand)
        
        present(controller, animated: true)
    }
    
    
    @IBAction func playPaper(_ sender: Any) {
        performSegue(withIdentifier: "navigateToResponse", sender: sender)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
            let destination = segue.destination as! ResponseViewController
            let userHand = Hand(rawValue: (sender as! UIButton).tag)!
            destination.game = playGame(userHand: userHand)
    }

}



extension PlayViewController {
    
    enum Hand: Int{
        case rock = 0, paper, scissor
    }
    
    func randomHand() -> Hand{
        let randomValue: Int = Int(arc4random() % 3)
        return Hand(rawValue: randomValue)!
    }
    
    func playGame(userHand: Hand) -> Game{
        let computerHand = randomHand()
        
        let result: Result = if(userHand.rawValue - computerHand.rawValue == 0) {
            Result.draw
        }else if( (userHand == .paper  && computerHand == .rock) 
                  || (userHand == .scissor  && computerHand == .paper)
                  || (userHand == .rock  && computerHand == .scissor) ) {
            Result.win
        }else {
            Result.lose
        }
        
        let description: Description = if(userHand.rawValue - computerHand.rawValue == 0) {
            Description.tie
        }else if(userHand.rawValue + computerHand.rawValue == 3){
            Description.ScissorsCutPaper
        }else if(userHand.rawValue + computerHand.rawValue == 2){
            Description.RockCrushesScissors
        }else{
            Description.PaperCoversRock
        }
        
        return Game(result: result, description: description)
    }
    
}

