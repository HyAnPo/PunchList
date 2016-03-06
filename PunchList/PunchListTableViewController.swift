//
//  PunchListTableViewController.swift
//  PunchList
//
//  Created by Andrew Porter on 2/16/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import UIKit

class PunchListTableViewController: UITableViewController {
    
    var building: Building?
    var punchList: PunchList?
    var unit: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - TableView Data Source methods
//    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
//        if let punchList = punchList, categories = punchList.categories {
//            return categories.count
//        } else {
//            return 0
//        }
//    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let punchList = self.punchList {
            return punchList.items.count
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("punchItemCell", forIndexPath: indexPath) as? PunchItemTableViewCell, punchList = punchList {
            let punchItem = punchList.items[indexPath.row]
            if let unit = unit {
                cell.updateCellWithDescription(punchItem, unit: unit)
                cell.delegate = self
                return cell
            } else if let building = building {
                if let buildingNumber = Int(building.buildingID) {
                    cell.updateCellWithDescription(punchItem, unit: buildingNumber)
                    cell.delegate = self
                    return cell
                }
            }
            return UITableViewCell()
        } else {
            return UITableViewCell()
        }
    }
    
    // MARK: - Buttons
    @IBAction func plusButtonTapped(sender: UIBarButtonItem) {
        addNewPunchItemWithAlertController()
    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetailView" {
            if let destinationViewController = segue.destinationViewController as? PunchDetailTableViewController {
                if let indexPath = tableView.indexPathForSelectedRow, punchList = self.punchList {
                    if let unit = unit {
                        destinationViewController.unit = unit
                        destinationViewController.punchItem = punchList.items[indexPath.row]
                    } else if let building = self.building {
                        destinationViewController.building = building
                        destinationViewController.punchItem = punchList.items[indexPath.row]
                    }
                }
            }
        }
    }
    
    // MARK: - Functions
    func addNewPunchItemWithAlertController() {
        let alert = UIAlertController(title: "Add New Punch Item", message: "Enter Punch description", preferredStyle: .Alert)
        alert.addTextFieldWithConfigurationHandler(nil)
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        let addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.Default) { (_) -> Void in
            if let textFields = alert.textFields, description = textFields[0].text, punchList = self.punchList {
                let punchItem = PunchItem(itemDescription: description, units: punchList.units)
                if let building = self.building, punchList = self.punchList {
                    ProjectController.sharedController.addPunchItemToPunchListForBuilding(building, punchList: punchList, punchItem: punchItem)
                    self.tableView.reloadData()
                }
                
            }
        }
        alert.addAction(addAction)
        alert.addAction(cancelAction)
    
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func changeCellTextColor(cell: UITableViewCell, colorForState: UIColor) {
        cell.textLabel?.textColor = colorForState
    }
    
}

extension PunchListTableViewController: PunchItemTableViewCellDelegate {
    
    func punchItemCellButtonTapped(sender: PunchItemTableViewCell) {
        if let indexPath = tableView.indexPathForCell(sender) {
            if let punchItem = punchList?.items[indexPath.row] {
                if let unit = self.unit {
                    PunchItemController.togglePunchItemComplete(punchItem, unit: unit)
                } else if let building = building {
                    if let buildingNumber = Int(building.buildingID) {
                        PunchItemController.togglePunchItemComplete(punchItem, unit: buildingNumber)
                    }
                }
            }
        }
        tableView.reloadData()
    }
}











































