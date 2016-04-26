
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
    var newPunchItemAlertController = UIAlertController()

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
    @IBAction func plusButtonTapped(sender: UIBarButtonItem) {
        addNewPunchItemWithAlertController()
        tableView.reloadData()
    }
    
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
    func addNewPunchItemWithAlertController() {
        let pickerView = self.configurePickerView()
        let pickerViewToolbar = self.configurePickerViewToolbar()
        
        let alert = UIAlertController(title: "Add New Punch Item", message: "Enter Punch description", preferredStyle: .Alert)
        self.newPunchItemAlertController = alert
        
        alert.addTextFieldWithConfigurationHandler { (descriptionTextField) -> Void in
            descriptionTextField.placeholder = "Punch Item Description"
            descriptionTextField.returnKeyType = .Next
            descriptionTextField.delegate = self
        }
   
        alert.addTextFieldWithConfigurationHandler { (categoryTextField) -> Void in
            pickerView.delegate = self
            categoryTextField.placeholder = "Category"
            categoryTextField.inputView = pickerView
            categoryTextField.inputAccessoryView = pickerViewToolbar
            
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler:  nil)
        
        let addAction = UIAlertAction(title: "Add", style: UIAlertActionStyle.Default) { (_) -> Void in
            if let textFields = alert.textFields, description = textFields[0].text, punchList = self.punchList, itemIndex = punchList.categories.last?.punchItems.count {
                let index = pickerView.selectedRowInComponent(0)
                let punchItem = PunchItem(itemDescription: description, index: itemIndex + 1)
                punchList.categories[index].punchItems.append(punchItem)
                self.tableView.reloadData()
            }
        }
        
        alert.addAction(addAction)
        alert.addAction(cancelAction)
        alert.actions[0].enabled = false
        presentViewController(alert, animated: true, completion: nil)
    }
    
    func configurePickerView() -> UIPickerView {
        let pickerView = UIPickerView()
        pickerView.dataSource = self
        pickerView.delegate = self
        
        return pickerView
    }
    
    func configurePickerViewToolbar() -> UIToolbar {
        let toolbar = UIToolbar()
        let cancelButton = UIBarButtonItem(barButtonSystemItem: .Cancel, target: self, action: #selector(PunchListTableViewController.cancelButton))
        let doneButton = UIBarButtonItem(barButtonSystemItem: .Done, target: self, action: #selector(PunchListTableViewController.doneButton))
        let spacer = UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: nil, action: nil)
        
        
        toolbar.setItems([cancelButton, spacer, doneButton], animated: true)
        toolbar.sizeToFit()
        toolbar.backgroundColor = UIColor.grayColor()
        toolbar.userInteractionEnabled = true
        
        return toolbar
    }
    
    func doneButton() {
        if let textFields = newPunchItemAlertController.textFields {
            textFields[1].resignFirstResponder()
        }
        
        if let textFields = newPunchItemAlertController.textFields, text = textFields[1].text {
            if !text.isEmpty {
                newPunchItemAlertController.actions[0].enabled = true
            }
        }
    }
    
    func cancelButton() {
        if let textFields = newPunchItemAlertController.textFields {
            textFields[1].resignFirstResponder()
        }
    }
    
    func changeCellTextColor(cell: UITableViewCell, colorForState: UIColor) {
        cell.textLabel?.textColor = colorForState
    }
    
}

// MARK: - Extensions

extension PunchListTableViewController: PunchItemTableViewCellDelegate {
    
    func punchItemCellButtonTapped(sender: PunchItemTableViewCell) {
        if let indexPath = tableView.indexPathForCell(sender), punchList = punchList {
            let punchItem = punchList.categories[indexPath.section].punchItems[indexPath.row]
            punchItem.isComplete = !punchItem.isComplete
            sender.toggleButtonImage(punchItem)
        }
    }
}

extension PunchListTableViewController: UIPickerViewDataSource, UIPickerViewDelegate, UITextFieldDelegate {
    
    // MARK: - PickerView Data source methods
    func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        if let punchList = punchList {
            return punchList.categories.count
        } else {
            return 0
        }
    }
    
    func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if let punchList = punchList {
            let category = punchList.categories[row]
            
            return category.title
        } else {
            return nil
        }
    }
    
    func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if let punchList = punchList {
            newPunchItemAlertController.textFields![1].text = punchList.categories[row].title
        }
    }
    
}









































