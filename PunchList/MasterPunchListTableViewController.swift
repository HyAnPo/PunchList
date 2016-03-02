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
            } else {
                return building.unitPunchLists.count
            }
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("punchListCell", forIndexPath: indexPath)
        
        if let building = building {
            if indexPath.section == 0 {
                let punchList = building.buildingPunchList[indexPath.row]
                cell.textLabel?.text = punchList.title
                return cell
            } else {
                let punchList = building.unitPunchLists[indexPath.row]
                cell.textLabel?.text = punchList.title
                return cell
            }
        } else {
            return cell
        }
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toUnitListView" {
            if let destinationViewController = segue.destinationViewController as? UnitListTableViewController {
                if let indexPath = tableView.indexPathForSelectedRow, building = self.building {
                    if indexPath.section == 0 {
                        let punchList = building.buildingPunchList[indexPath.row]
                        destinationViewController.punchList = punchList
                    } else {
                        let punchList = building.unitPunchLists[indexPath.row]
                        destinationViewController.punchList = punchList
                    }
                    destinationViewController.building = building
                }
            }
        }
    }
}
