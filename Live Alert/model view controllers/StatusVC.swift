//
//  StatusVC.swift
//  Live Alert
//
//  Created by Akshat Gupta on 27/07/18.
//  Copyright © 2018 Live Alert. All rights reserved.
//

import UIKit

class StatusVC: subView,UITableViewDelegate,UITableViewDataSource {
    //var
   var cameraFeed : [UIImage] = [#imageLiteral(resourceName: "video1"),#imageLiteral(resourceName: "video2")]
    var deviceList : [[String]]!
    var deviceType : [String]!
//views

    @IBOutlet weak var view_timeline: UIView!
    @IBOutlet weak var view_cameras: UIView!
    @IBOutlet weak var view_devices: UIView!
    
    //tableview
    @IBOutlet weak var timelineTableView: UITableView!
    @IBOutlet weak var cameraTableView: UITableView!
    @IBOutlet weak var devicesTableView: UITableView!
    
    
    
    
    //outlets
    @IBOutlet weak var segment: UISegmentedControl!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        feedDevice()
        
         timelineTableView.dataSource = self
        timelineTableView.delegate = self
        cameraTableView.dataSource = self
        cameraTableView.delegate = self
        devicesTableView.dataSource = self
        devicesTableView.delegate = self
        
        
        timelineTableView.register(TimelineTableCell.self, forCellReuseIdentifier: "timelineCell")
        timelineTableView.register(UINib(nibName: "TimelineTableCell", bundle: nil), forCellReuseIdentifier: "timelineCell")
        cameraTableView.register(CamerasTableCell.self, forCellReuseIdentifier: "cameraCell")
        cameraTableView.register(UINib(nibName: "CamerasTableCell", bundle: nil), forCellReuseIdentifier: "cameraCell")
        devicesTableView.register(DevicesTableCell.self, forCellReuseIdentifier: "deviceCell")
        devicesTableView.register(UINib(nibName: "DevicesTableCell", bundle: nil), forCellReuseIdentifier: "deviceCell")
       
        // Do any additional setup after loading the view.
        
        
            
        
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.setTitle(title: "STATUS")
    }

    @IBAction func segmentChanged(_ sender: UISegmentedControl) {
        if segment.selectedSegmentIndex == 0 {
            view_timeline.isHidden = false
            view_cameras.isHidden = true
            view_devices.isHidden = true
        }
        if segment.selectedSegmentIndex == 1 {
            view_timeline.isHidden = true
            view_cameras.isHidden = false
            view_devices.isHidden = true
            view_cameras.frame = CGRect(x: 0, y: view_timeline.frame.minY, width: view_timeline.frame.width, height: view_timeline.frame.height)
           
        }
        if segment.selectedSegmentIndex == 2 {
            view_timeline.isHidden = true
            view_cameras.isHidden = true
            view_devices.isHidden = false
            view_devices.frame = CGRect(x: 0, y: view_timeline.frame.minY, width: view_timeline.frame.width, height: view_timeline.frame.height)
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch tableView {
        case timelineTableView:
            return 10
        case cameraTableView:
            return 2
        case devicesTableView:
            return (deviceList[section].count)

        default:
            return 1
        }
        
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        if tableView == devicesTableView{
             return deviceType.count
        }
        return 1
       
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if tableView == devicesTableView{
            return 55
        }
        return 0
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        if tableView == devicesTableView{
            let label = UILabel()
            label.frame = CGRect(x: 10, y: 0, width: 375, height: 55)
            label.backgroundColor = UIColor.gray
            label.text = deviceType[section]
            return label
        }
        return UIView()
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var returnCell = UITableViewCell()
        switch tableView {
        case timelineTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "timelineCell", for: indexPath) as! TimelineTableCell
            returnCell = cell
            break
        case cameraTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "cameraCell", for: indexPath) as! CamerasTableCell
            
            cell.videoImg.image = cameraFeed[indexPath.row]
            returnCell = cell
            break
        case devicesTableView:
            let cell = tableView.dequeueReusableCell(withIdentifier: "deviceCell", for: indexPath) as! DevicesTableCell
            let text = deviceList[indexPath.section][indexPath.row]
            cell.setLabel(name: text)
            returnCell = cell
            break
        default:
            break
        }
        
        return returnCell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        switch tableView {
        case timelineTableView:
            return 64
        case cameraTableView:
            return 210
        case devicesTableView:
            return 64
        default:
            return 64
        }
    }
    func feedDevice(){
        deviceType = ["Doors & Windows","Motion","Streaming Camera","Environmental","Access Control"]
        deviceList = [["Patio Door","Guest Room Window","Front Entry Door","Garage Door Inside","Garage Door Outside"],
                      ["PVS Occupancy","Kitchen ","Living Room"],
                      ["Fama Streaming cam",],
                      ["OCCU sensor", "Glass Break Sensor"],
                      ["Remote"]
                      ]
    }

}
