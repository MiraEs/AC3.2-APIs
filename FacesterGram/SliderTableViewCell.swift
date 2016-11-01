//
//  SliderTableViewCell.swift
//  FacesterGram
//
//  Created by Ilmira Estil on 11/1/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

protocol SliderCellDelegate {
    func changedTheSliderTo(value:Int)
}

class SliderTableVIewCellTableViewCell: UITableViewCell {
    var delegate: SliderCellDelegate?
    
    static let cellIdentifier = "SliderCell"
    @IBOutlet weak var resultsLabel: UILabel!
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var numberOfResultsLabel: UILabel!
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    internal func updateSlider(min: Int, max: Int, current: Int) {
        self.slider.minimumValue = 1
        self.slider.maximumValue = 200
        self.slider.setValue(Float(current), animated: true)
        self.resultsLabel.text = "\(current)"
        
    }
    
    @IBAction func didChangeValue(_ sender: UISlider) {
        self.resultsLabel.text = "\(Int(sender.value))"
        self.delegate?.changedTheSliderTo(value: Int(sender.value))
        
    }
}

