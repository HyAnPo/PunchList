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

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    // MARK: - Functions
    func updateCellWithDescription(punchItem: PunchItem, unit: Int) {
        punchDescriptionLabel.text = punchItem.itemDescription
        updateButtonImage(punchItem, unit: unit)
    }
    
    func updateButtonImage(punchItem: PunchItem, unit: Int) {
        if punchItem.completedUnits.contains(unit) == true {
            completeButton.imageView?.image = UIImage(named: "complete")
        } else if !punchItem.completedUnits.contains(unit) {
            completeButton.imageView?.image = UIImage(named: "incomplete")
        }
    }

}