//
//  ViewController.swift
//  TicTac
//
//  Created by Artem Karmaz on 3/5/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

class MainViewController: Clock {
    
    @IBOutlet weak var showActualTimeLabel: UILabel!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = Preferences.background
        showActualTimeLabel.isHidden = Preferences.showHideDigitalTime
        createWatchFace()
        createSecondArrow()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createClock()
        showTime()
    }

    
    private func showTime() {
        timer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector:#selector(showDateAndTime) , userInfo: nil, repeats: true)
    }
    
    @objc func showDateAndTime() {
        showActualTimeLabel.text = DateFormatter.localizedString(from: Date(), dateStyle: .medium, timeStyle: .medium)
    }

}

