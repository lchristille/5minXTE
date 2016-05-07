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
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = true
        
        let url = NSURL(string: "https://www.oltrenuovefrontiere.it/live.html")
        let request1 = NSURLRequest(URL: url!)
        let response: AutoreleasingUnsafeMutablePointer<NSURLResponse?>=nil
        var textToBeViewed = NSMutableAttributedString()
        
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
        
        UIApplication.sharedApplication().networkActivityIndicatorVisible = false
        
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
