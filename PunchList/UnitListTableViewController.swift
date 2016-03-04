//
//  UnitListTableViewController.swift
//  PunchList
//
//  Created by Andrew Porter on 2/16/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import UIKit

class UnitListTableViewController: UITableViewController {

    var building: Building?
    var punchList: PunchList?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    // MARK: - TableView Data Source methods
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let building = self.building {
            return building.units
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("unitCell", forIndexPath: indexPath)
        
        if let _ = self.building {
            cell.textLabel?.text = String(indexPath.row + 1)
            return cell
        } else {
            return cell
        }
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toPunchList" {
            if let destinationViewController = segue.destinationViewController as? PunchListTableViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let unit = indexPath.row
                    if let punchList = self.punchList, building = self.building {
                        destinationViewController.building = building
                        destinationViewController.punchList = punchList
                        destinationViewController.unit = unit
                    }
                }
            }
        }
    }
}
