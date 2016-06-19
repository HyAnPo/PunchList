//
//  BuildingListTableViewController.swift
//  PunchList
//
//  Created by Andrew Porter on 2/16/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import UIKit

class BuildingListTableViewController: UITableViewController {
    
    var project: Project!
    var buildings = [Building]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    // MARK: - TabelView Data Source methods
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return buildings.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("buildingCell", forIndexPath: indexPath)
        let building = buildings[indexPath.row]
        cell.textLabel?.text = building.buildingName
        return cell
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toPunchLists" {
            if let destinationViewController = segue.destinationViewController as? MasterPunchListTableViewController {
                if let indexPath = tableView.indexPathForSelectedRow {
                    let building = buildings[indexPath.row]
                    destinationViewController.building = building
                }
            }
        }
    }
    
}
