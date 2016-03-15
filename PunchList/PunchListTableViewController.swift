//
//  PunchListTableViewController.swift
//  PunchList
//
//  Created by Andrew Porter on 2/16/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import UIKit

class PunchListTableViewController: UITableViewController {
    
    var punchList: PunchList?

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
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        if let punchList = punchList {
            return punchList.categories.count
        } else {
            return 1
        }
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let punchList = punchList {
            return punchList.categories[section].title
        } else {
            return nil
        }
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let punchList = punchList {
            return punchList.categories[section].punchItems.count
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCellWithIdentifier("punchItemCell", forIndexPath: indexPath) as? PunchItemTableViewCell, punchList = punchList {
            let punchItem = punchList.categories[indexPath.section].punchItems[indexPath.row]
            cell.updateCellWithPunchItem(punchItem)
            cell.delegate = self
        
            return cell
        } else {
            return UITableViewCell()
        }
    }
    
    // MARK: - Buttons
//    @IBAction func plusButtonTapped(sender: UIBarButtonItem) {
//        addNewPunchItemWithAlertController()
//    }
    
    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toDetailView" {
            if let destinationViewController = segue.destinationViewController as? PunchDetailTableViewController, indexPath = tableView.indexPathForSelectedRow, punchList = self.punchList {
                let punchItem = punchList.categories[indexPath.section].punchItems[indexPath.row]
                destinationViewController.punchItem = punchItem
            }
        }
    }
    
    // MARK: - Functions
//    func addNewPunchItemWithAlertController() {
//        let alert = UIAlertController(title: "Add New Punch Item", message: "Enter Punch description", preferredStyle: .Alert)
//        alert.addTextFieldWithConfigurationHandler(nil)
//        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
//        let addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.Default) { (_) -> Void in
//            if let textFields = alert.textFields, description = textFields[0].text, punchList = self.punchList {
//                let punchItem = PunchItem(itemDescription: description, category: nil, units: punchList.units)
//                if let building = self.building, punchList = self.punchList {
//                    ProjectController.sharedController.addPunchItemToPunchListForBuilding(building, punchList: punchList, punchItem: punchItem)
//                    self.tableView.reloadData()
//                }
//                
//            }
//        }
//        alert.addAction(addAction)
//        alert.addAction(cancelAction)
//    
//        presentViewController(alert, animated: true, completion: nil)
//    }
    
    func changeCellTextColor(cell: UITableViewCell, colorForState: UIColor) {
        cell.textLabel?.textColor = colorForState
    }
    
}

extension PunchListTableViewController: PunchItemTableViewCellDelegate {
    
    func punchItemCellButtonTapped(sender: PunchItemTableViewCell) {
        if let indexPath = tableView.indexPathForCell(sender), punchList = punchList {
            let punchItem = punchList.categories[indexPath.section].punchItems[indexPath.row]
            punchItem.isComplete = !punchItem.isComplete
            sender.toggleButtonImage()
        }
        tableView.reloadData()
    }
}











































