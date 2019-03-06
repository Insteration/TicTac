//
//  BackgroundColorViewController.swift
//  TicTac
//
//  Created by Artem Karmaz on 3/6/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

class ChangeColorViewController: UIViewController {
    
    @IBOutlet var colorButtons: [UIButton]!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("Status \(Preferences.colorChanger)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        colorButtons.enumerated().forEach({ index, button in
            button.tag = index
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 1
            button.layer.borderColor = UIColor.black.cgColor
            if button.tag == 0 {
                button.addTarget(self, action: #selector(getBlueColorValue), for: .touchUpInside)
            } else if button.tag == 1 {
                button.addTarget(self, action: #selector(getGreenColorValue), for: .touchUpInside)
            } else if button.tag == 2 {
                button.addTarget(self, action: #selector(getYellowColorValue), for: .touchUpInside)
            } else if button.tag == 3 {
                button.addTarget(self, action: #selector(getPurpleColorValue), for: .touchUpInside)
            } else if button.tag == 4 {
                button.addTarget(self, action: #selector(getGreyColorValue), for: .touchUpInside)
            } else if button.tag == 5  {
                button.addTarget(self, action: #selector(getRedColorValue), for: .touchUpInside)
            } else {
                button.addTarget(self, action: #selector(getWhiteColorValue), for: .touchUpInside)
            }
        })
    }
    
    @objc func getBlueColorValue() {
        print("Color setup blue")
        if Preferences.colorChanger {
            Preferences.background = .blue
        } else {
            Preferences.secondArrowColor = UIColor.blue.cgColor
        }
    }
    
    @objc func getGreenColorValue() {
        print("Color setup green")
        if Preferences.colorChanger {
            Preferences.background = .green
        } else {
            Preferences.secondArrowColor = UIColor.green.cgColor
        }
    }
    
    @objc func getYellowColorValue() {
        print("Color setup yellow")
        if Preferences.colorChanger {
            Preferences.background = .yellow
        } else {
            Preferences.secondArrowColor = UIColor.yellow.cgColor
        }
    }
    
    @objc func getPurpleColorValue() {
        print("Color setup purple")
        if Preferences.colorChanger {
            Preferences.background = .purple
        } else {
            Preferences.secondArrowColor = UIColor.purple.cgColor
        }
    }
    
    @objc func getGreyColorValue() {
        print("Color setup grey")
        if Preferences.colorChanger {
            Preferences.background = .gray
        } else {
            Preferences.secondArrowColor = UIColor.gray.cgColor
        }
    }
    
    @objc func getRedColorValue() {
        print("Color setup red")
        if Preferences.colorChanger {
            Preferences.background = .red
        } else {
            Preferences.secondArrowColor = UIColor.red.cgColor
        }
    }
    
    @objc func getWhiteColorValue() {
        print("Color setup white")
        if Preferences.colorChanger {
            Preferences.background = .white
        } else {
            Preferences.secondArrowColor = UIColor.white.cgColor
        }
    }
    
}
