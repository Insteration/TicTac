//
//  PreferencesModel.swift
//  TicTac
//
//  Created by Artem Karmaz on 3/6/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

struct Preferences {
    static var background: UIColor = .white
    static var secondArrow = false
    static var colorChanger = true
    static var secondArrowColor = UIColor.blue.cgColor
    static var showHideDigitalTime = false
    static var watchFaceName = UIImage(named: "WatchFace1.png")?.cgImage
}
