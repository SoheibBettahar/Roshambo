//
//  ResponseViewController.swift
//  Roshambo
//
//  Created by Soheib on 6/11/2023.
//

import UIKit

class ResponseViewController: UIViewController {

    
    @IBOutlet weak var responseImage: UIImageView!
    @IBOutlet weak var responseLabel: UILabel!
    
    var game: Game!
    
    override func viewWillAppear(_ animated: Bool) {
        let prefix = switch(game.description){
            case .PaperCoversRock:
                 "Paper Covers Rock"
            case .RockCrushesScissors:
                 "Rock Crushes Scissors"
            case .ScissorsCutPaper:
                 "Scissors Cut Paper"
            default:
                "its A Tie"
        }
        
        let suffix = switch(game.result){
            case .win:
                "You Win!"
            case .lose:
                "You Lose!"
            default:
                "Its A Draw!"
    }
        
        responseLabel.text = "\(prefix). \(suffix)"
        responseImage.image = UIImage(named:  game.description.rawValue)
    }
    
    
    override func viewDidAppear(_ animated: Bool) {
        
    }
    
    
    @IBAction func playAgain(_ sender: Any) {
        self.dismiss(animated: true)
    }

}
