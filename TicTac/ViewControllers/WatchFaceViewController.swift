//
//  WatchFaceViewController.swift
//  TicTac
//
//  Created by Artem Karmaz on 3/6/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

class WatchFaceViewController: UIViewController {
    
    @IBOutlet var watchFaceButtons: [UIButton]!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        watchFaceButtons.enumerated().forEach({ index, button in
            button.tag = index
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            if button.tag == 0 {
                button.addTarget(self, action: #selector(getWatchFaceFirst), for: .touchUpInside)
            } else if button.tag == 1 {
                button.addTarget(self, action: #selector(getWatchFaceSecond), for: .touchUpInside)
            } else if button.tag == 2 {
                button.addTarget(self, action: #selector(getWatchFaceThird), for: .touchUpInside)
            } else if button.tag == 3 {
                button.addTarget(self, action: #selector(getWatchFaceFourth), for: .touchUpInside)
            } else {
                button.addTarget(self, action: #selector(getWatchFaceFifth), for: .touchUpInside)
            }
        })
    }
    
    @objc func getWatchFaceFirst() {
        Preferences.watchFaceName = UIImage(named: "WatchFace1.png")?.cgImage
    }
    
    @objc func getWatchFaceSecond() {
        Preferences.watchFaceName = UIImage(named: "WatchFace2.png")?.cgImage
    }
    
    @objc func getWatchFaceThird() {
        Preferences.watchFaceName = UIImage(named: "WatchFace3.png")?.cgImage
    }
    
    @objc func getWatchFaceFourth() {
        Preferences.watchFaceName = UIImage(named: "WatchFace4.png")?.cgImage
    }
    
    @objc func getWatchFaceFifth() {
        Preferences.watchFaceName = UIImage(named: "WatchFace5.png")?.cgImage
    }
    
}
