//
//  PreferencesTableViewController.swift
//  TicTac
//
//  Created by Artem Karmaz on 3/6/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

class PreferencesTableViewController: UITableViewController {
    
    enum Segue {
        static let changeBackgroundColor = "ChangeBackgroundColor"
        static let changeSecondArrowColor = "ChangeSecondArrowColor"
    }
    
    //MARK:- Outlets
    
    @IBOutlet weak var showHideSecondArrowSwitch: UISwitch!
    @IBOutlet weak var showHideDigitalTimeSwitch: UISwitch!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        
        if Preferences.secondArrow {
            showHideSecondArrowSwitch.isOn = true
        } else {
            showHideSecondArrowSwitch.isOn = false
        }
        
        if Preferences.showHideDigitalTime {
            showHideDigitalTimeSwitch.isOn = true
        } else {
            showHideDigitalTimeSwitch.isOn = false
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    //MARK:- Actions
    
    @IBAction func showHideSecondArrowSwitchAction(_ sender: UISwitch) {
        if showHideSecondArrowSwitch.isOn {
            Preferences.secondArrow = true
            print("State is second arrow \(Preferences.secondArrow)")
        } else {
            Preferences.secondArrow = false
            print("State is second arrow \(Preferences.secondArrow)")
        }
    }
    
    @IBAction func showHideDigitalTimeSwitchAction(_ sender: UISwitch) {
        if showHideDigitalTimeSwitch.isOn {
            Preferences.showHideDigitalTime = true
            print("State is show time \(Preferences.showHideDigitalTime)")
        } else {
            Preferences.showHideDigitalTime = false
            print("State is show time \(Preferences.showHideDigitalTime)")
        }
    }
    
    
    //MARK:- Segue
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {        
        if Segue.changeBackgroundColor == segue.identifier {
            Preferences.colorChanger = true
        } else if Segue.changeSecondArrowColor == segue.identifier {
            Preferences.colorChanger = false
        }
    }
    
    
}
