//
//  SettingsTableViewController.swift
//  FacesterGram
//
//  Created by Ilmira Estil on 10/27/16.
//  Copyright © 2016 C4Q. All rights reserved.
//

import UIKit

//slider delegate stuff should be in SliderTableViewCell (cleaner)
protocol SliderCellDelegate {
    func sliderDidChange(_ value: Int)
}

class SettingsTableViewController: UITableViewController {
    
    var delegate: SliderCellDelegate? //what is the utility of delegate for didchange function?
    
    //set up outlets and give self.slider the properties set in SettingsManager swift file -- did change value function -> call manager function here
    static let callIdentifier: String = "SliderCell"
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var numberOfResultsLabel: UILabel!
    
    internal func updateSlider(min: Int, max: Int, current: Int) {
        self.slider.minimumValue = Float(min)
        self.slider.maximumValue = Float(max)
        self.slider.setValue(Float(current), animated: true)
        self.numberOfResultsLabel.text = "\(current)"
    }
    @IBAction func didChangeValue(_ sender: UISlider) {
        self.numberOfResultsLabel.text = "\(Int(sender.value))"
        self.delegate?.sliderDidChange(Int(sender.value)) //why are we doing this? --
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 1
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SliderCell", for: indexPath)
        
        // Configure the cell...
        
        return cell
    }
    
    //use switch statement changing indexpath.section for each prototype cell vs. per row?
    
    
    
    // MARK: - Navigation
    /*
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destinationViewController.
     // Pass the selected object to the new view controller.
     if let gvc = segue.destination as? UsersTableViewController, sender: Any? {
     
     
     }
     }
     */
    
    
}
