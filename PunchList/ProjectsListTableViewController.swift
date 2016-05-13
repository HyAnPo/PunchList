//
//  ProjectsListTableViewController.swift
//  PunchList
//
//  Created by Andrew Porter on 12/2/15.
//  Copyright © 2015 Andrew Porter. All rights reserved.
//

import UIKit

class ProjectsListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
//        if UserController.sharedController.currentUser == nil {
//            
//            performSegueWithIdentifier("loginscreen", sender: nil)
//
//        }

        navigationController?.toolbarHidden = true
        
        
        PunchItemController.punchItemFromIdentifier("-KHcXPHPRBx3mt9_p9KI") { (punchItem) in
            
            if let punchItem = punchItem {
                
                PunchItemController.togglePunchItemComplete(punchItem, completion: { (success, punchItem) in
                    print(punchItem?.isComplete)
                })
                
                PunchItemController.addNoteToPunchItem(punchItem, note: "Does this work?", completion: { (success, post) in
                    
                    print(success)
                })
                
            } else {
                
                print("No punch item was returned")
            }
            
            
        }
        
    }
    
    override func viewWillAppear(animated: Bool) {
        tableView.reloadData()
    }
    
    // MARK: - TableView Data Source methods
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProjectController.sharedController.projectsArray.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("projectCell", forIndexPath: indexPath)
        
        let project = ProjectController.sharedController.projectsArray[indexPath.row]
        
        cell.textLabel?.text = project.name
        
        return cell
    }
    
    // MARK: - TableView Delegate methods
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            let project = ProjectController.sharedController.projectsArray[indexPath.row]
            ProjectController.deleteProject(project)
            
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        }
    }
    
    // MARK: - Buttons
    
//    @IBAction func logoutButtonTapped(sender: AnyObject) {
//        
//        UserController.logoutCurrentUser()
//        performSegueWithIdentifier("loginscreen", sender: nil)
//    }

    // MARK: - Navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "toBuildingList" {
            let destinationViewController = segue.destinationViewController as? BuildingListTableViewController
            
            if let indexPath = tableView.indexPathForSelectedRow {
                let project = ProjectController.sharedController.projectsArray[indexPath.row]
                destinationViewController?.project = project
            }
        }
    }
}
