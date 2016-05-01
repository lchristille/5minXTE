//
//  LiveViewController.swift
//  DiocesiAL
//
//  Created by Luca Christille on 25/03/16.
//  Copyright © 2016 Luca Christille. All rights reserved.
//

import UIKit

class LiveViewController: UIViewController {

    @IBOutlet weak var textLive: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://www.oltrenuovefrontiere.it/live.html")
        let request1 = NSURLRequest(URL: url!)
        let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        var textToBeViewed = NSMutableAttributedString(string: "Nessun testo da visualizzare")
        
        do {
            let dataVal = try NSURLConnection.sendSynchronousRequest(request1, returningResponse: response)
            do {
                textToBeViewed = try NSMutableAttributedString(data: dataVal, options: [NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType], documentAttributes: nil)
                
            } catch {
                print ("error")
            }
        } catch {
            print ("error")
        }
        
        textToBeViewed.beginEditing()
        textToBeViewed.addAttributes([NSFontAttributeName: UIFont.preferredFontForTextStyle(UIFontTextStyleBody)], range: NSMakeRange(0, textToBeViewed.length))
        
        textLive.attributedText = textToBeViewed
        

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillAppear(animated: Bool) {
        textLive.scrollEnabled = false
    }
    
    override func viewDidAppear(animated: Bool) {
        textLive.scrollEnabled = true
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
