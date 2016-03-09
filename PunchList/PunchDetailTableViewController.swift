//
//  PunchDetailTableViewController.swift
//  PunchList
//
//  Created by Andrew Porter on 2/16/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import UIKit

class PunchDetailTableViewController: UITableViewController {

    @IBOutlet var descriptionLabel: UILabel!
    @IBOutlet var notesTextView: UITextView!
    @IBOutlet var punchButton: UIBarButtonItem!
    
    var punchItem: PunchItem?
    var unit: Int?
    var building: Building?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let punchItem = self.punchItem {
            updateWithPunchItem(punchItem)
        }
    }
    
    // MARK: - Buttons
    @IBAction func punchButtonTapped(sender: UIBarButtonItem) {
        markPunchComplete()
    }
    
    @IBAction func saveButtonTapped(sender: UIBarButtonItem) {
        if let punchItem = punchItem {
            if let noteText = notesTextView.text {
                if noteText != punchItem.notes {
                    punchItem.notes = noteText
                }
            }
        }
        navigationController?.popViewControllerAnimated(true)
    }

    // MARK: - Functions
    func updateWithPunchItem(punchItem: PunchItem) {
        changeButton()
        descriptionLabel.text = punchItem.itemDescription
        if let punchItemNotes = punchItem.notes {
            notesTextView.text = punchItemNotes
        }
    }
    
    func changeButton() {
        if let punchItem = punchItem {
            if let unit = unit {
                if punchItem.completedUnits.contains(unit) {
                    punchButton.title = "✔️"
                } else {
                    punchButton.title = "👊🏻"
                }
            } else if let building = self.building {
                if let buildingNumber = Int(building.buildingID) {
                    if punchItem.completedUnits.contains(buildingNumber) {
                        punchButton.title = "✔️"
                    } else {
                        punchButton.title = "👊🏻"
                    }
                }
            }
        }
    }
    
    func markPunchComplete() {
        if let punchItem = punchItem {
            if let unit = self.unit {
                PunchItemController.togglePunchItemComplete(punchItem, unit: unit)
                changeButton()
            } else if let building = self.building {
                if let buildingNumber = Int(building.buildingID) {
                    PunchItemController.togglePunchItemComplete(punchItem, unit: buildingNumber)
                    changeButton()
                }
            }
        }
    }
}
