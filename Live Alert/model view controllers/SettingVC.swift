//
//  SettingVC.swift
//  Live Alert
//
//  Created by Akshat Gupta on 27/07/18.
//  Copyright © 2018 Live Alert. All rights reserved.
//

import UIKit

class SettingVC: subView {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var editBtn: UIButton!
    @IBOutlet weak var settingsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
     profilePic.layer.cornerRadius = profilePic.bounds.height/2
     editBtn.layer.cornerRadius = 10
        name.text = "Pankaj Manchanda"
        email.text = "pankaj.manchanda@icloud.com"
        // Do any additional setup after loading the view.
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setTitle(title: "SETTINGS")
    }
    @IBAction func editPressed(_ sender: Any) {
    }
    
}
