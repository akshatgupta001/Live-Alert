//
//  DevicesTableCell.swift
//  Live Alert
//
//  Created by Akshat Gupta on 30/07/18.
//  Copyright © 2018 Live Alert. All rights reserved.
//

import UIKit

class DevicesTableCell: UITableViewCell {

    @IBOutlet weak var icon: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var state: UIImageView!
    
    func setLabel(name : String){
        self.name.text = name 
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
