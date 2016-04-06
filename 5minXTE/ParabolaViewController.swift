//
//  ParabolaViewController.swift
//  DiocesiAL
//
//  Created by Luca Christille on 25/03/16.
//  Copyright © 2016 Luca Christille. All rights reserved.
//

import UIKit

class ParabolaViewController: UIViewController {
    
    @IBOutlet weak var titolo: UILabel!
    @IBOutlet weak var testo: UITextView!
    

    let titoloAttributes = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleHeadline), ]
    let testoAttributes = [NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleBody)]
    
    var selectedParabola = Parabola(_title: "", _text: "")
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let titleString = NSMutableAttributedString(string: selectedParabola.title)
        titleString.beginEditing()
        titleString.addAttributes(testoAttributes, range: NSMakeRange(0, titleString.length))
        titleString.endEditing()
        
        let formattedString = NSMutableAttributedString.init(attributedString: selectedParabola.attributedText)
        formattedString.beginEditing()
        formattedString.addAttributes(testoAttributes, range: NSMakeRange(0, formattedString.length))
        formattedString.endEditing()
        
        titolo.attributedText = titleString
        testo.attributedText = formattedString
        testo.scrollsToTop = true
    }
    
    override func viewWillAppear(animated: Bool) {
        testo.scrollEnabled = false
    }
    
    override func viewDidAppear(animated: Bool) {
        testo.scrollEnabled = true
    }
    

}
