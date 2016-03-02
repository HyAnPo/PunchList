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
    var unit: Int?

    override func viewDidLoad() {
        super.viewDidLoad()

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }

    // MARK: - TableView Data Source methods
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let punchList = self.punchList {
            return punchList.items.count
        } else {
            return 0
        }
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("punchItemCell", forIndexPath: indexPath)
        let punchItem = punchList?.items[indexPath.row]
        
        cell.textLabel?.text = punchItem?.itemDescription
        return cell
    }
}
