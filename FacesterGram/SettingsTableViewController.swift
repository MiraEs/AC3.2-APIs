//
//  SettingsTableViewController.swift
//  FacesterGram
//
//  Created by Ilmira Estil on 10/27/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit


class SettingsTableViewController: UITableViewController {

    
    //set up outlets and give self.slider the properties set in SettingsManager swift file -- did change value function -> call manager function here
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 3
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell: UITableViewCell!
        
        // Configure the cell...
        switch indexPath.row {
        case 0:
            //that's weird i dont undestand this yet -- 
            //cell currently does not know the properties of the SlideCell class properties, need to make newCell to take in properties so function can update those here in tableView (kinda like weird segue?)
            cell = tableView.dequeueReusableCell(withIdentifier: SliderTableViewCell.cellIdentifier)
            if let sliderCell = cell as? SliderTableViewCell {
                sliderCell.delegate = SettingManager.manager
                
            }
        case 1:
            cell = tableView.dequeueReusableCell(withIdentifier: SegementedTableViewCell.cellIdentifier)
            if let segmentCell = cell as? SegementedTableViewCell {
                segmentCell.delegate = SettingManager.manager
                
            }
        default:
            cell = tableView.dequeueReusableCell(withIdentifier: SwitchTableViewCell.cellIdentifier)
            if let switchCell = cell as? SwitchTableViewCell {
                switchCell.delegate = SettingManager.manager
            }
 
        }
        
        return cell
    }
    
    //use switch statement changing indexpath.section for each prototype cell vs. per row?
    
    
    
}
