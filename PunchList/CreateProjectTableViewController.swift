//
//  CreateProjectTableViewController.swift
//  PunchList
//
//  Created by Andrew Porter on 3/2/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import UIKit

class CreateProjectTableViewController: UITableViewController {
    
    @IBOutlet var projectNameTextField: UITextField!
    @IBOutlet var numberOfBuildingsTextField: UITextField!
    @IBOutlet var unitsPerBuildingTextField: UITextField!
    @IBOutlet var estimatedFinishDateTextField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 3
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    //MARK: - Buttons
    @IBAction func createButtonTapped(sender: UIBarButtonItem) {
        if let projectName = projectNameTextField.text, numberOfBuildings = numberOfBuildingsTextField.text, unitsPerBuilding = unitsPerBuildingTextField.text, numberOfBuildingsIntValue: Int = Int(numberOfBuildings), unitsPerBuildingIntValue: Int = Int(unitsPerBuilding) {
            let newProject = Project(identifier: nil, name: projectName, pin: nil, numberOfBuildings: numberOfBuildingsIntValue, unitsPerBuilding: unitsPerBuildingIntValue)
            ProjectController.sharedController.projectsArray.append(newProject)
        }
        navigationController?.popToRootViewControllerAnimated(true)
    }
    
    
}
