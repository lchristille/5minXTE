//
//  EventiTableViewController.swift
//  5minXTE
//
//  Created by Luca Christille on 29/04/16.
//  Copyright © 2016 Luca Christille. All rights reserved.
//

import UIKit

class EventiTableViewController: UITableViewController {
    
    let eventiToBeViewed = ["sab 30/04 - h21:00/23:00, Corso Roma", "sab 07/05 - h21:00/23:00, Corso Roma", "sab 21/05 - h21:00/23:00, Corso Roma", "sab 28/05 - h21:00/23:00, Corso Roma", "sab 04/06 - h21:00/23:00, Corso Roma", "sab 11/06 - h21:00/23:00, Corso Roma", "sab 18/06 - h21:00/23:00, Corso Roma", "sab 25/06 - Stay Tuned!"]
    
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
