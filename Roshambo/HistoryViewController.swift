//
//  HistoryViewController.swift
//  Roshambo
//
//  Created by Soheib on 10/11/2023.
//

import UIKit

class HistoryViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var history: [Game]!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return history.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "game", for: indexPath)
        
        let game = history[indexPath.row]
        
        let handsPlayed = "\(game.p1.name()) VS \(game.p2.name())"
        
        let result = switch(game.result){
            case .win:
                "Win!"
            case .lose:
                "Loss."
            default:
                "Draw."
        }
        
        cell.textLabel?.text = result
        cell.detailTextLabel?.text = handsPlayed
        
        return cell
    }
    

   

}
