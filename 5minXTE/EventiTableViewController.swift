//
//  EventiTableViewController.swift
//  5minXTE
//
//  Created by Luca Christille on 29/04/16.
//  Copyright © 2016 Luca Christille. All rights reserved.
//

import UIKit

class EventiTableViewController: UITableViewController {
    
    let eventiToBeViewed = ["30/04 - San Giovannino Corso Roma", "07/05 - San Giovannino Corso Roma", "21/05 - San Giovannino Corso Roma", "28/05 - San Giovannino Corso Roma", "04/06 - San Giovannino Corso Roma", "11/06 - San Giovannino Corso Roma", "18/06 - San Giovannino Corso Roma", "25/06 - Stay Tuned!"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return eventiToBeViewed.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "EventiTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! EventiTableViewCell
        
        cell.lblEvento.text = eventiToBeViewed[indexPath.row]
        
        return cell
    }

    
}
