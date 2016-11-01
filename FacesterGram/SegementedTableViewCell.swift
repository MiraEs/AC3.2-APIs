//
//  SegementedTableViewCell.swift
//  FacesterGram
//
//  Created by Ilmira Estil on 11/1/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

protocol  SegmentedCellDelegate {
    func changeSegmentControl(value:Int)
}
class SegementedTableViewCell: UITableViewCell {
   
    var delegate: SegmentedCellDelegate?
    static let cellIdentifier = "SegementedTableViewCellIdentifier"
    
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    
   
    @IBAction func genderSegmentedControl(_ sender: UISegmentedControl) {
        print("segemented Control")
    }
    
    
}
