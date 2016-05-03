//
//  Parabola.swift
//  DiocesiAL
//
//  Created by Luca Christille on 27/03/16.
//  Copyright © 2016 Luca Christille. All rights reserved.
//

import UIKit

class ParabolaTableViewController   : UITableViewController {
    
    // MARK: Properties
    
    var paraboleToBeViewed = ParaboleModel()
    
    var showHome = false
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
        paraboleToBeViewed = ParaboleModel.paraboleFromFiles()
        
        let rightButtonView = UIView(frame: CGRectMake(0,0,25,25))
        let rightButton = UIButton(type: .System)
        rightButton.backgroundColor = UIColor.clearColor()
        rightButton.frame = rightButtonView.frame
        rightButton.setTitle("?", forState: .Normal)
        rightButton.tintColor = UIColor.redColor()
        rightButton.autoresizesSubviews = true
        rightButton.autoresizingMask = [UIViewAutoresizing.FlexibleWidth, UIViewAutoresizing.FlexibleLeftMargin]
        rightButton.addTarget(self, action: #selector(ParabolaTableViewController.segueForHome), forControlEvents: UIControlEvents.TouchUpInside)
        rightButtonView.addSubview(rightButton)
        
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(customView: rightButtonView)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return paraboleToBeViewed.parabole.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "ParabolaTableViewCell"
        let cell = tableView.dequeueReusableCellWithIdentifier(cellIdentifier, forIndexPath: indexPath) as! ParabolaTableViewCell
        
        let parabola = paraboleToBeViewed.parabole[indexPath.row]
        
        cell.NameLabel.text = parabola.title
        
        return cell
    }
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ShowDetail" {
            if showHome {
                let parabolaViewController = segue.destinationViewController as! ParabolaViewController
                parabolaViewController.selectedParabola = ParaboleModel.readParabolaFromFile("Ciao, benvenuto in #5minXTE!", _filename: "benvenuto")!
                showHome = false
            } else {
                let parabolaViewController = segue.destinationViewController as! ParabolaViewController
                if let selParabolaCell = sender as? ParabolaTableViewCell {
                    let indexPath = tableView.indexPathForCell(selParabolaCell)
                    let selParabola = paraboleToBeViewed.parabole[indexPath!.row]
                    parabolaViewController.selectedParabola = selParabola
                }

            }
        }
    }
    
    func segueForHome() {
        showHome = true
        self.performSegueWithIdentifier("ShowDetail", sender: self)
    }
}
