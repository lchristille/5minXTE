//
//  Parabola.swift
//  DiocesiAL
//
//  Created by Luca Christille on 27/03/16.
//  Copyright © 2016 Luca Christille. All rights reserved.
//

import Foundation

class Parabola {
    
    let title: String
    let text: String
    let attributedText: NSAttributedString
    
    init(_title: String, _text: String) {
        self.title = _title
        self.text = _text
        self.attributedText = NSAttributedString(string: _text)
    }
    
    init(_title: String, _attributedText: NSAttributedString) {
        self.title = _title
        self.attributedText = _attributedText
        self.text = _attributedText.string
    }
}
