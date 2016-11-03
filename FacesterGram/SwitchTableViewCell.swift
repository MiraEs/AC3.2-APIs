//
//  SwitchTableViewCell.swift
//  FacesterGram
//
//  Created by Ilmira Estil on 11/1/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit
protocol  SwitchCellDelegate {
    func changeSegmentControl(segmentIndex:Int)
}

class SwitchTableViewCell: UITableViewCell {

    @IBOutlet weak var nationalitySwitch: UISwitch!
    var delegate: SwitchCellDelegate?
    static let cellIdentifier = "SwitchCell"
    
    
    internal func updateSwitch(index: Int) {
        
    }
    
    @IBAction func nationalitySwitch(_ sender: UISwitch) {
    
    }
  

}
