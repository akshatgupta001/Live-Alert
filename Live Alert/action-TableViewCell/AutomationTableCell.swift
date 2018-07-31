//
//  AutomationTableCell.swift
//  Live Alert
//
//  Created by Akshat Gupta on 27/07/18.
//  Copyright © 2018 Live Alert. All rights reserved.
//

import UIKit
protocol automationCellDelegate {
    func didSwitch(cell : AutomationTableCell)
}
class AutomationTableCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    
    var delegate : automationCellDelegate!
    @IBOutlet weak var mySwitch: UISwitch!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    @IBAction func toggleSwitch(_ sender: UISwitch) {
        print("toggle")
        delegate.didSwitch(cell: self)
        
    }
    func setupWithmodel(model : AutomationCellModel){
        label.text = model.name
        mySwitch.setOn(model.value, animated: true)
    }
   
    
    
    
}
