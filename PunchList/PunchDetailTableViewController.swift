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
    
    override func viewWillAppear(animated: Bool) {
        navigationController?.toolbarHidden = false
    }
    
    override func viewDidDisappear(animated: Bool) {
        navigationController?.toolbarHidden = true
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
        navigationController?.toolbarHidden = true
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
            if !punchItem.isComplete {
                punchButton.title = "👊🏻"
            } else {
                punchButton.title = "✔️"
            }
        }
    }
    
    func markPunchComplete() {
        if let punchItem = punchItem {
            PunchItemController.togglePunchItemComplete(punchItem)
        }
    }
}
