//
//  settingTableCell.swift
//  Live Alert
//
//  Created by Akshat Gupta on 31/07/18.
//  Copyright © 2018 Live Alert. All rights reserved.
//

import UIKit

class settingTableCell: UITableViewCell {
    
     let imgView = UIImageView(image: #imageLiteral(resourceName: "settings"))
    @IBOutlet weak var view: UIView!
    @IBOutlet weak var label: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        imgView.sizeToFit()
        imgView.frame = CGRect(x: 2, y: 2, width: 36, height: 36)
        
        
        view.addSubview(imgView)
    }
  
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
