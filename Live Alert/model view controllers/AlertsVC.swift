//
//  AlertsVC.swift
//  Live Alert
//
//  Created by Akshat Gupta on 31/07/18.
//  Copyright © 2018 Live Alert. All rights reserved.
//

import UIKit

class AlertsVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var segmentControl: UISegmentedControl!
    @IBOutlet weak var pendingView: UIView!
    var alertArray : [String] = []

    @IBOutlet weak var AlertTableView: UITableView!
    @IBAction func backPressed(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    @IBOutlet weak var navBar: UINavigationBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        AlertTableView.dataSource = self
        AlertTableView.delegate = self
        AlertTableView.register(AlertTableCell.self, forCellReuseIdentifier: "alertCell")
        AlertTableView.register(UINib(nibName: "AlertTableCell", bundle: nil), forCellReuseIdentifier: "alertCell")
      
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
        //return alertArray.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "alertCell", for: indexPath)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 60
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
   
    @IBAction func segemntChanged(_ sender: Any) {
        if segmentControl.selectedSegmentIndex == 0 {
            
            AlertTableView.isHidden = true
            pendingView.isHidden = false
        }else{
            pendingView.isHidden = true
            AlertTableView.isHidden = false
            
        }
    }
    
}
