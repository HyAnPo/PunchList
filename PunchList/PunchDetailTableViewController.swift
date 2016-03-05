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
    

    // MARK: - Functions
    func updateWithPunchItem(punchItem: PunchItem) {
        changeButton()
        descriptionLabel.text = punchItem.itemDescription
        if let unit = self.unit {
            notesTextView.text = punchItem.notes[unit]
        }
    }
    
    func changeButton() {
        if let punchItem = punchItem, unit = unit {
            if punchItem.completedUnits.contains(unit) {
                punchButton.title = "✔️"
            }
        }
    }
    
    func markPunchComplete() {
        if let punchItem = punchItem, unit = unit {
            if !punchItem.completedUnits.contains(unit) {
                punchItem.completedUnits.append(unit)
                punchButton.title = "✔️"
            } else {
                if let index = punchItem.completedUnits.indexOf(unit) {
                    punchItem.completedUnits.removeAtIndex(index)
                    punchButton.title = "👊🏻"
                }
            }
        }
    }
}
