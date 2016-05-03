//
//  ParaboleModel.swift
//  DiocesiAL
//
//  Created by Luca Christille on 25/03/16.
//  Copyright © 2016 Luca Christille. All rights reserved.
//

import Foundation
import UIKit

class ParaboleModel {
    
    // MARK: Properties
    
    var parabole: [Parabola]
    
    init() {
        parabole = [Parabola]()
    }
    
    func addParabola(_parabola: Parabola) {
        parabole.append(_parabola)
    }
    
    func getParabole() -> [Parabola] {
        return parabole
    }
    
    static func paraboleFromFiles() -> ParaboleModel {
        let returnParabModel = ParaboleModel()
        let ParaboleDict = ["I Due Debitori del creditore":"iduedebitoridelcreditore", "Il Buon Samaritano":"ilbuonsamaritano", "La Pecora e La Dracma Perdute e Ritrovate":"lapecoraeladracma", "Il Padre Misericordioso (Figliol Prodigo)":"padremisericordioso", "Il Fariseo e il Pubblicano al Tempio":"fariseopubblicano", "Il Giudice e la Vedova":"ilgiudiceelavedova", "Il Ricco e il Povero Lazzaro":"ilriccoeilpoverolazzaro", "La Donna Adultera":"ladonnaadultera", "La Samaritana al Pozzo di Giacobbe":"lasamaritanaalpozzodigiacobbe", "Zaccheo":"zaccheo"]
        
        
        for (titolo, filename) in ParaboleDict {
            if let readParabola = readParabolaFromFile(titolo, _filename: filename) {
                returnParabModel.addParabola(readParabola)
            }
        }
        return returnParabModel
    }
    
    static func readParabolaFromFile(_title:String, _filename:String) -> Parabola? {
        var attrString = NSAttributedString()
        if let htmlURL = NSBundle.mainBundle().URLForResource(_filename, withExtension: "html") {
            do {
                attrString = try NSAttributedString(URL:htmlURL, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
                
            } catch {
                print ("error")
            }
        }

        return Parabola(_title: _title, _attributedText: attrString)
    }
}