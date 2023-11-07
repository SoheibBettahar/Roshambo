//
//  PlayResult.swift
//  Roshambo
//
//  Created by Soheib on 6/11/2023.
//

import Foundation


enum Description: String{
    case tie = "itsATie", PaperCoversRock = "PaperCoversRock", RockCrushesScissors = "RockCrushesScissors", ScissorsCutPaper = "ScissorsCutPaper"
}

enum Result{
    case win, draw, lose
}

struct Game{
    
    var result: Result!
    var description: Description!
    
    init(result: Result!, description: Description!) {
        self.result = result
        self.description = description
    }
}

