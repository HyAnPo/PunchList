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
    func updateCellWithDescription(punchItem: PunchItem, unit: Int) {
        punchDescriptionLabel.text = punchItem.itemDescription
        if punchItem.completedUnits.contains(unit) {
            completeButton.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            completeButton.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
        
        if !punchItem.completedUnits.contains(unit) && punchItem.notes != nil {
            punchDescriptionLabel.textColor = UIColor.orangeColor()
        } else {
            punchDescriptionLabel.textColor = UIColor.blackColor()
        }
    }
    
    func toggleButtonImage() {
        if completeButton.imageView?.image == UIImage(named: "incomplete") {
            completeButton.setImage(UIImage(named: "complete"), forState: .Normal)
        } else {
            completeButton.setImage(UIImage(named: "incomplete"), forState: .Normal)
        }
    }

}