//
//  MasterPunchListTableViewController.swift
//  PunchList
//
//  Created by Andrew Porter on 2/16/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import UIKit

class MasterPunchListTableViewController: UITableViewController {
    
    var building: Building!
    var buildingPunchLists: [PunchList]?
    var unitPunchLists: [PunchList]?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    //MARK: - TableView Data Source methods
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Building Punch List"
        } else {
            return "Unit Punch Lists"
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        var rows = 0
        
        if section == 0 {
            if let buildingPunchLists = self.buildingPunchLists {
                rows = buildingPunchLists.count
            }
        } else {
            if let unitPunchLists = self.unitPunchLists {
                rows = unitPunchLists.count
            }
        }
        return rows
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("buildingPunchListCell", forIndexPath: indexPath)
            let punchList = buildingPunchLists![indexPath.row]
            cell.textLabel?.text = punchList.title
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("unitPunchListCell", forIndexPath: indexPath)
            let punchList = unitPunchLists![indexPath.row]
            cell.textLabel?.text = punchList.title
            return cell
        }
    }
    
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toUnitListView" {
            if let destinationViewController = segue.destinationViewController as? UnitListTableViewController, indexPath = tableView.indexPathForSelectedRow, building = self.building {
                
                destinationViewController.building = building
                destinationViewController.punchListIndex = indexPath.row
            }
        } else if segue.identifier == "toPunchListTableView" {
            if let destinationViewController = segue.destinationViewController as? PunchListTableViewController, buildingPunchLists = buildingPunchLists, indexPath = tableView.indexPathForSelectedRow {
                
                let punchList = buildingPunchLists[indexPath.row]
                destinationViewController.punchList = punchList
            }
        }
    }
}

















