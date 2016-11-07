//
//  SwitchTableViewCell.swift
//  FacesterGram
//
//  Created by Ilmira Estil on 11/1/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit
protocol  SwitchCellDelegate {
    func selectionDidChange(option: String, value: Bool)
}

class SwitchTableViewCell: UITableViewCell {
    
    @IBOutlet weak var nationalitySwitch: UISwitch!
    var delegate: SwitchCellDelegate?
    static let cellIdentifier = "SwitchCell"
    
    
    internal func updateElements(key: String, value: Bool) {
        //self.optionLabel.text = key
        self.nationalitySwitch.isOn = value
    }
    
    @IBAction func nationalitySwitch(_ sender: UISwitch) {
    self.delegate?.selectionDidChange(option: "", value: sender.isOn)
    }
  

}
