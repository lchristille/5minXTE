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
    

    let titoloAttributes: [String : AnyObject]
    let testoAttributes: [String : AnyObject]
    
    var selectedParabola = ParaboleModel.readParabolaFromFile("Ciao, benvenuto in #5minXTE!", _filename: "benvenuto")!
    
    required init?(coder aDecoder: NSCoder) {
        let bodyParagraph = NSMutableParagraphStyle()
        bodyParagraph.alignment = .justified
        self.testoAttributes = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.body), NSParagraphStyleAttributeName: bodyParagraph]
        
        let titleParagraph = NSMutableParagraphStyle()
        titleParagraph.alignment = .right
        self.titoloAttributes = [NSFontAttributeName: UIFont.preferredFont(forTextStyle: UIFontTextStyle.title1), NSParagraphStyleAttributeName: titleParagraph]
        
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
    
    override func viewWillAppear(_ animated: Bool) {
        testo.isScrollEnabled = false
    }
    
    override func viewDidAppear(_ animated: Bool) {
        testo.isScrollEnabled = true
    }
    

}
