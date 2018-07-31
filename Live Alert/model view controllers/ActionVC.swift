//
//  ActionVC.swift
//  Live Alert
//
//  Created by Akshat Gupta on 27/07/18.
//  Copyright © 2018 Live Alert. All rights reserved.
//

import UIKit

class ActionVC: subView,UITableViewDelegate,UITableViewDataSource{
   

    //local variable
    var automationArray : [String] = ["Auto Away", "Auto Home"]
    var quickActionArray : [String] = ["Home Mode", "Photo Status"]
    var feedAutomationModelArray =  [AutomationCellModel]()
    //outlets
    @IBOutlet weak var quickActionView: UIView!
    @IBOutlet weak var automationView: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var quickActionTableView: UITableView!
    @IBOutlet weak var automationTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        quickActionTableView.delegate = self
        quickActionTableView.dataSource = self
        quickActionTableView.register(quickActionTableCell.self, forCellReuseIdentifier: "quickActionCell")
        quickActionTableView.register(UINib(nibName: "quickActionTableCell", bundle: nil), forCellReuseIdentifier: "quickActionCell")
        
        automationTableView.register(AutomationTableCell.self, forCellReuseIdentifier: "AutomationCell")
         automationTableView.register(UINib(nibName: "AutomationTableCell", bundle: nil), forCellReuseIdentifier: "AutomationCell")
        automationTableView.delegate = self
        automationTableView.dataSource = self
        fillDataArray()
    }
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(true)
        setTitle(title: "ACTION")
        
        
        
    }
    func fillDataArray (){
        for index in 0...1 {
            let model = AutomationCellModel()
            model.name = automationArray[index]
            feedAutomationModelArray.append(model)
            automationTableView.dataSource = self
            automationTableView.delegate = self
        }
    }
    
    //Table View functions
     //assign values in table
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var returnCell = UITableViewCell()
        if tableView == quickActionTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "quickActionCell", for: indexPath) as! quickActionTableCell
            
                cell.label.text = quickActionArray[indexPath.row]
            
            returnCell = cell
            
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "AutomationCell", for: indexPath) as! AutomationTableCell
            cell.label.text = automationArray[indexPath.row]
            cell.delegate = self
            cell.setupWithmodel(model: feedAutomationModelArray[indexPath.row])
            returnCell = cell
        }
        return returnCell
    }
    //table view function ends
    
    @IBAction func SegmentChanged(_ sender: Any) {
        if segmentControl.selectedSegmentIndex == 0 {
            quickActionView.isHidden = false
            automationView.isHidden = true
        }
        if segmentControl.selectedSegmentIndex == 1 {
            quickActionView.isHidden = true
            automationView.frame = CGRect(x: 0, y: quickActionView.frame.minY, width: quickActionView.frame.width, height: quickActionView.frame.height)
            automationView.isHidden = false
            quickActionView.isHidden = true
        }
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if tableView == automationTableView {
            return 2
        }else{
            return 2
        
    }
   
    
   

   
    
    }
}
extension ActionVC : automationCellDelegate {
    func didSwitch(cell: AutomationTableCell) {
        let indexpath = automationTableView.indexPath(for: cell)
        feedAutomationModelArray[indexpath!.row].value = cell.mySwitch.isOn
    }
}
