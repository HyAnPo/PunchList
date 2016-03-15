//
//  MasterPunchListTableViewController.swift
//  PunchList
//
//  Created by Andrew Porter on 2/16/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import UIKit

class MasterPunchListTableViewController: UITableViewController {
    
    var building: Building?

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
        if let building = building {
            if section == 0 {
                return building.buildingPunchList.count
            } else if building.units.count >= 1 {
                return building.units[0].punchLists.count
            }
            return 1
        } else {
            return 1
        }
    }
    
    // This is the unitPunchListCell data source method
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCellWithIdentifier("buildingPunchListCell", forIndexPath: indexPath)
            let punchList = building?.buildingPunchList[indexPath.row]
            cell.textLabel?.text = punchList?.title
            return cell
        } else {
            let cell = tableView.dequeueReusableCellWithIdentifier("unitPunchListCell", forIndexPath: indexPath)
            let punchList = building?.units[0].punchLists[indexPath.row]
            cell.textLabel?.text = punchList?.title
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
            if let destinationViewController = segue.destinationViewController as? PunchListTableViewController, building = self.building, indexPath = tableView.indexPathForSelectedRow {
                
                let punchList = building.buildingPunchList[indexPath.row]
                destinationViewController.punchList = punchList
            }
        }
    }
}
