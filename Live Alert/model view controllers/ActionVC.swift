//
//  ActionVC.swift
//  Live Alert
//
//  Created by Akshat Gupta on 27/07/18.
//  Copyright © 2018 Live Alert. All rights reserved.
//

import UIKit

class ActionVC: subView,UITableViewDelegate,UITableViewDataSource{
   static let sharedAction = ActionVC()
    
    @IBOutlet weak var addActionBtn: UIButton!
    
    //local variable
    var automationArray : [String] = ["Auto Away", "Auto Home"]
    var quickActionArray : [String] = ["Home Mode", "Photo Status",]
    var quickActionRows : [[String]] = [["Change System Mode to home","Capture images from all motion cameras"],
                                        ["Capture images from all motion cameras"]
                                       ]
    var quickActionVisible : [Bool] = [false,false]
    var feedAutomationModelArray =  [AutomationCellModel]()
    //outlets
    @IBOutlet weak var quickActionView: UIView!
    @IBOutlet weak var automationView: UIView!
    @IBOutlet weak var segmentControl: UISegmentedControl!
    
    @IBOutlet weak var quickActionTableView: UITableView!
    @IBOutlet weak var automationTableView: UITableView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        addActionBtn.layer.cornerRadius = addActionBtn.bounds.height/10
        
        quickActionTableView.delegate = self
        quickActionTableView.dataSource = self
        quickActionTableView.register(quickActionTableCell.self, forCellReuseIdentifier: "quickActionCell")
        quickActionTableView.register(UINib(nibName: "quickActionTableCell", bundle: nil), forCellReuseIdentifier: "quickActionCell")
        quickActionTableView.register(ActionHeaderView.self, forHeaderFooterViewReuseIdentifier: "actionHeaderView")
        quickActionTableView.register(UINib(nibName: "ActionHeaderView", bundle: nil), forHeaderFooterViewReuseIdentifier: "actionHeaderView")
        
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
   
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       if tableView == quickActionTableView
       {
         let headerView = tableView.dequeueReusableHeaderFooterView(withIdentifier: "actionHeaderView")
       // headerView?.detailTextLabel?.text = "hi"
        
        
        let button = UIButton(type: .system)
        button.setBackgroundImage(#imageLiteral(resourceName: "right-arrow"), for: .normal)
        button.frame = CGRect(x: 320, y: 15, width: 30, height: 30)
        button.tag = section
        button.addTarget(self, action: #selector(toggle), for: .touchUpInside)
        headerView?.addSubview(button)
      //  headerView?.addSubview(label)
       // headerView?.backgroundColor = UIColor.gray
        let header = headerView as! ActionHeaderView
        header.label.text = quickActionArray[section]
        
        return header
        
        }
        return UIView()
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == quickActionTableView{
           return 60
        }
        return 0
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == quickActionTableView{
            return quickActionArray.count
        }
        return 1
    }
    
    @objc func toggle(sender : UIButton){
  
        var indexPaths = [IndexPath]()
        for i in 0..<quickActionRows[sender.tag].count {
            
            indexPaths.append(IndexPath(row: i, section: sender.tag))
        }
        if quickActionVisible[sender.tag] == false {
                            quickActionVisible[sender.tag] = true
                            quickActionTableView.insertRows(at: indexPaths, with: .fade)
            
                        }else{
                             quickActionVisible[sender.tag] = false
                              quickActionTableView.deleteRows(at: indexPaths, with: .fade)
                        }
        print(sender.tag)
        print(quickActionVisible[sender.tag])
        
       
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var returnCell = UITableViewCell()
        if tableView == quickActionTableView {
            let cell = tableView.dequeueReusableCell(withIdentifier: "quickActionCell", for: indexPath) as! quickActionTableCell
            
                cell.label.text = quickActionRows[indexPath.section][indexPath.row]
            
            
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
            if quickActionVisible[section] == true {
                return quickActionRows[section].count
            }else{
                return 0
            }
        
        }
   
    }
}
extension ActionVC : automationCellDelegate {
    func didSwitch(cell: AutomationTableCell) {
        let indexpath = automationTableView.indexPath(for: cell)
        feedAutomationModelArray[indexpath!.row].value = cell.mySwitch.isOn
    }
}
