//
//  MasterPunchListTableViewController.swift
//  PunchList
//
//  Created by Andrew Porter on 2/16/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import UIKit

class MasterPunchListTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    @IBAction func addPunchListButtonTapped(sender: UIBarButtonItem) {
        let alertController = UIAlertController(title: "Add Punch List", message: "Enter a PunchList name", preferredStyle: .Alert)
        alertController.addTextFieldWithConfigurationHandler { (punchListNameField) -> Void in
            punchListNameField.placeholder = "Punch list name"
        }
        alertController.addAction(UIAlertAction(title: "Create", style: .Default, handler: { (action) -> Void in
            
            
        }))
    }
}
