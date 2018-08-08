//
//  SettingVC.swift
//  Live Alert
//
//  Created by Akshat Gupta on 27/07/18.
//  Copyright © 2018 Live Alert. All rights reserved.
//

import UIKit

class SettingVC: subView,UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var profilePic: UIImageView!
    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var email: UILabel!
    @IBOutlet weak var editBtn: UIButton!
    
    var settingList : [String] = ["Change Monthly Plan","Update Credit card", "Location Assistant", "Add Device", "Remove Device", "Manage Users", "Manage Emergency Contacts","Manage Notification","IFTTT", "LiveAlert Support","QuickTour", "Logout"]
    var settingIcon : [UIImage] = [#imageLiteral(resourceName: "logo"),#imageLiteral(resourceName: "card"), #imageLiteral(resourceName: "location"), #imageLiteral(resourceName: "add"),#imageLiteral(resourceName: "remove"), #imageLiteral(resourceName: "user"), #imageLiteral(resourceName: "contact"),#imageLiteral(resourceName: "bell-1"),#imageLiteral(resourceName: "IFTT"),#imageLiteral(resourceName: "support"),#imageLiteral(resourceName: "tour"),#imageLiteral(resourceName: "power") ]
    @IBOutlet weak var settingsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
     profilePic.layer.cornerRadius = profilePic.bounds.height/2
     editBtn.layer.cornerRadius = 10
        name.text = "John Doe"
        email.text = "john.doe2@icloud.com"
        // Do any additional setup after loading the view.
        
        settingsTableView.register(settingTableCell.self, forCellReuseIdentifier: "settingsCell")
        settingsTableView.register(UINib(nibName: "settingTableCell", bundle: nil   ), forCellReuseIdentifier: "settingsCell")
        
        settingsTableView.delegate = self
        settingsTableView.dataSource = self
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return settingList.count
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 50
        
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "settingsCell", for: indexPath) as! settingTableCell
         cell.label.text = self.settingList[indexPath.row]
        cell.imgView.image = self.settingIcon[indexPath.row]
        return cell
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setTitle(title: "SETTINGS")
    }
    @IBAction func editPressed(_ sender: Any) {
    }
    
}
