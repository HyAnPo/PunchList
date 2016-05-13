//
//  PunchItemTableViewCell.swift
//  PunchList
//
//  Created by Andrew Porter on 3/4/16.
//  Copyright © 2016 Andrew Porter. All rights reserved.
//

import UIKit

protocol PunchItemTableViewCellDelegate {
    
    func punchItemCellButtonTapped(sender: PunchItemTableViewCell)
}

class PunchItemTableViewCell: UITableViewCell {
    
    @IBOutlet var punchDescriptionLabel: UILabel!
    @IBOutlet var completeButton: UIButton!
    
    var delegate: PunchItemTableViewCellDelegate?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    // MARK: - Buttons
    @IBAction func buttonTapped(sender: UIButton) {
        if let delegate = delegate {
            delegate.punchItemCellButtonTapped(self)
        }
    }
    
    
    // MARK: - Functions
    func updateCellWithPunchItem(punchItem: PunchItem) {
        punchDescriptionLabel.text = punchItem.itemDescription
        
        if punchItem.isComplete {
            completeButton.imageView?.image = UIImage(named: "complete")
        } else {
            completeButton.imageView?.image = UIImage(named: "incomplete")
        }
        
    }
    
    func toggleButtonImage(punchItem: PunchItem) {
        
        if punchItem.isComplete {
            completeButton.setImage(UIImage(named: "complete"), forState: .Normal)
        } else if !punchItem.isComplete {
            completeButton.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
        
        //FirebaseController.base.childByAppendingPath(<#T##pathString: String!##String!#>)
    }

}