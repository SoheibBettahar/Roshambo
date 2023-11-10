//
//  PlayResult.swift
//  Roshambo
//
//  Created by Soheib on 6/11/2023.
//

import Foundation

enum Hand: Int{
    case rock = 0, paper, scissors
    
    func name() -> String {
        let name = if(self == .rock){
            "Rock"
        }else if(self == .paper){
            "Paper"
        }else{
            "Scissors"
        }
        
        return name
    }
    
}


enum Description: String{
    case tie = "itsATie", PaperCoversRock = "PaperCoversRock", RockCrushesScissors = "RockCrushesScissors", ScissorsCutPaper = "ScissorsCutPaper"
}

enum Result{
    case win, draw, lose
}

struct Game{
    var p1: Hand!
    var p2: Hand!
    
    var result: Result!
    var description: Description!
    
    init(p1: Hand, p2: Hand) {
        self.p1 = p1
        self.p2 = p2
        self.result = computeResult(p1: p1, p2: p2)
        self.description = computeDescription(p1: p1, p2: p2)
    }
    
    
   private func computeResult(p1: Hand, p2: Hand) -> Result {
        
        let result: Result = if(p1.rawValue - p2.rawValue == 0) {
            Result.draw
        }else if( (p1 == .paper  && p2 == .rock)
                  || (p1 == .scissors  && p2 == .paper)
                  || (p1 == .rock  && p2 == .scissors) ) {
            Result.win
        }else {
            Result.lose
        }
        
        return result
    }
    
   private func computeDescription(p1: Hand, p2: Hand) -> Description {
        
        let description: Description = if(p1.rawValue - p2.rawValue == 0) {
            Description.tie
        }else if(p1.rawValue + p2.rawValue == 3){
            Description.ScissorsCutPaper
        }else if(p1.rawValue + p2.rawValue == 2){
            Description.RockCrushesScissors
        }else{
            Description.PaperCoversRock
        }
            
        return description
    }
    
}

