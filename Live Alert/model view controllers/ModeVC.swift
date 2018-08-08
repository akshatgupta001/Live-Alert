//
//  ModeVC.swift
//  Live Alert
//
//  Created by Akshat Gupta on 07/08/18.
//  Copyright © 2018 Live Alert. All rights reserved.
//

import UIKit

class ModeVC: UIViewController {
    let preferences = UserDefaults.standard

    @IBOutlet weak var AlarmView: UIView!
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var awayView: UIView!
    @IBOutlet weak var standbyView: UIView!
    @IBOutlet weak var homeLbl: UILabel!
    @IBOutlet weak var awayLbl: UILabel!
    @IBOutlet weak var standbyLbl: UILabel!
    
    @IBOutlet weak var doorImg: UIImageView!
    @IBOutlet weak var motionImg: UIImageView!
    override func viewDidLoad() {
        if preferences.string(forKey: "mode") != nil {
            switch preferences.string(forKey: "mode") {
               case "home" :
                homeTap()
                break
               case "away" :
                awayTap()
                 break
               case "standby" :
                standbyTap()
                break
            default :
                standbyTap()
                break
            }
        }
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(close))
        let tapHome = UITapGestureRecognizer(target: self, action:  #selector(homeTap))
        let tapAway = UITapGestureRecognizer(target: self, action:  #selector(awayTap))
        let tapStandby = UITapGestureRecognizer(target: self, action:  #selector(standbyTap))
        homeView.addGestureRecognizer(tapHome)
        awayView.addGestureRecognizer(tapAway)
        standbyView.addGestureRecognizer(tapStandby)
        self.view.addGestureRecognizer(tap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    @objc func homeTap(){
      selectView(view: homeView, lbl: homeLbl)
        doorImg.image = #imageLiteral(resourceName: "radio_on")
        motionImg.image = #imageLiteral(resourceName: "raadio_off")
        preferences.set("home", forKey: "mode")
    }
    @objc func awayTap(){
        selectView(view: awayView, lbl: awayLbl)
        doorImg.image = #imageLiteral(resourceName: "radio_on")
        motionImg.image = #imageLiteral(resourceName: "radio_on")
        preferences.set("away", forKey: "mode")
    }
    @objc func standbyTap(){
       selectView(view: standbyView, lbl: standbyLbl)
        
        doorImg.image = #imageLiteral(resourceName: "raadio_off")
        motionImg.image = #imageLiteral(resourceName: "raadio_off")
        preferences.set("standby", forKey: "mode")
    }
    
     @objc func close(){
       
        dismiss(animated: true, completion: nil)
    }

    func selectView(view : UIView, lbl : UILabel){
        self.homeView.backgroundColor = UIColor.white
        self.awayView.backgroundColor = UIColor.white
        self.standbyView.backgroundColor = UIColor.white
        self.homeLbl.textColor = UIColor.black
        self.awayLbl.textColor = UIColor.black
        self.standbyLbl.textColor = UIColor.black
        view.backgroundColor = UIColor.black
        lbl.textColor = UIColor.white
        
        
    }
    
   
}
