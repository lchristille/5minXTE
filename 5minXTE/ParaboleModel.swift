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
    
    static func defaultParabole() -> ParaboleModel {
        let defaultParabModel = ParaboleModel()
        let primaParabola = Parabola(_title: "I due debitori del creditore", _text: "Uno dei farisei lo invitò a mangare da lui. Egli entrò nella casa del fariseo e si mise a tavola")
        defaultParabModel.addParabola(primaParabola)
        let secondaParabola = Parabola(_title: "Il buon samaritano", _text: "Un dottore della legge si alzò per metterlo alla prova: «Maestro, che devo fare per ereditare la vita eterna?»")
        defaultParabModel.addParabola(secondaParabola)
        return defaultParabModel
    }
    
    static func paraboleFromFiles() -> ParaboleModel {
        let returnParabModel = ParaboleModel()
        var attrString = NSAttributedString()
        let ParaboleDict = ["I Due Debitori del creditore":"iduedebitoridelcreditore", "Il Buon Samaritano":"ilbuonsamaritano", "La Pecora e La Dracma Perdute e Ritrovate":"lapecoraeladracma", "Il Padre Misericordioso (Figliol Prodigo)":"padremisericordioso"]
        
        
        for (titolo, filename) in ParaboleDict {
            if let htmlURL = NSBundle.mainBundle().URLForResource(filename, withExtension: "html") {
                do {
                    attrString = try NSAttributedString(URL:htmlURL, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
                } catch {
                    print ("error")
                }
            }
            returnParabModel.addParabola(Parabola(_title: titolo, _attributedText: attrString))
        }
        return returnParabModel
    }
}