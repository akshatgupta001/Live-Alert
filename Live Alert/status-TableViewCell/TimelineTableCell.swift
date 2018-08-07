//
//  TimelineTableCell.swift
//  Live Alert
//
//  Created by Akshat Gupta on 30/07/18.
//  Copyright © 2018 Live Alert. All rights reserved.
//

import UIKit

class TimelineTableCell: UITableViewCell {

    @IBOutlet weak var imgview: UIImageView!
    
    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var timeline: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    func setImg(num : Int){
        if num == 1 {
            self.imgview.image = #imageLiteral(resourceName: "door_open_black")
        }else {
            self.imgview.image = #imageLiteral(resourceName: "door_close_black")
        }
    }
    
}
