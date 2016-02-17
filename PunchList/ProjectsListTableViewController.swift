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
        
        if UserController.sharedController.currentUser == nil {
            
            performSegueWithIdentifier("loginscreen", sender: nil)

        }

    }
    
    // MARK: - Buttons
    
    @IBAction func logoutButtonTapped(sender: AnyObject) {
        
        UserController.logoutCurrentUser()
        performSegueWithIdentifier("loginscreen", sender: nil)
    }

}
