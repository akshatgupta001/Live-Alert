//
//  ModeVC.swift
//  Live Alert
//
//  Created by Akshat Gupta on 07/08/18.
//  Copyright © 2018 Live Alert. All rights reserved.
//

import UIKit

class ModeVC: UIViewController {

    @IBOutlet weak var AlarmView: UIView!
    @IBOutlet weak var homeView: UIView!
    @IBOutlet weak var awayView: UIView!
    @IBOutlet weak var standbyView: UIView!
    @IBOutlet weak var homeLbl: UILabel!
    @IBOutlet weak var awayLbl: UILabel!
    @IBOutlet weak var standbyLbl: UILabel!
    
    override func viewDidLoad() {
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
    }
    @objc func awayTap(){
        selectView(view: awayView, lbl: awayLbl)
        
    }
    @objc func standbyTap(){
       selectView(view: standbyView, lbl: standbyLbl)
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
