//
//  SegementedTableViewCell.swift
//  FacesterGram
//
//  Created by Ilmira Estil on 11/1/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

protocol  SegmentedCellDelegate {
    func changeSegmentControl(segmentIndex:Int)
}
class SegementedTableViewCell: UITableViewCell {
    var delegate: SegmentedCellDelegate?
    static let cellIdentifier = "SegementedTableViewCellIdentifier"
    @IBOutlet weak var genderSegmentedControl: UISegmentedControl!
    
   
    internal func updateSelectedSegment(index: Int) {
        genderSegmentedControl.selectedSegmentIndex = index
    }
   
    @IBAction func genderSegmentedControl(_ sender: UISegmentedControl) {
            self.delegate?.changeSegmentControl(segmentIndex: sender.selectedSegmentIndex)
    }
    
    
}
