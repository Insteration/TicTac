//
//  ViewController.swift
//  TicTac
//
//  Created by Artem Karmaz on 3/5/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var hour = CALayer()
    var minute = CALayer()
    var second = CALayer()
    var watchFace = CALayer()
    
    let pi = Double.pi
    let myLayer = CALayer()
    let date = Date()
    let calendar = Calendar(identifier: .gregorian)
    var actualTime = [Int]()
    var timeFloat = [CGFloat]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        createMyLayer()
//        createWatchFace()
        createHourArrow()
        createMinuteArrow()
        createSecondArrow()
        createDataCalendar()
        calculateAnglesForArrowsOfClock()
        createAnimationForEachLayer()

    }
    
    //MARK:- Create Clock Enfine

    private func createMyLayer() {
        myLayer.frame = self.view.frame
        self.view.layer.addSublayer(myLayer)
    }
    
    private func createWatchFace() {
        watchFace.backgroundColor = UIColor.clear.cgColor
        watchFace.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        watchFace.position = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2)
        watchFace.bounds = CGRect(x: 0, y: 0, width: ((self.view.frame.size.width / 2) - 20) * 2, height: ((self.view.frame.size.width / 2) - 20))
        watchFace.contents = UIImage(named: "WatchFace.jpg")?.cgImage
        myLayer.addSublayer(watchFace)
    }
    
    private func createHourArrow() {
        hour.backgroundColor = UIColor.black.cgColor
        hour.anchorPoint = CGPoint(x: 0.5, y: 0)
        hour.position = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2)
        hour.bounds = CGRect(x: 0, y: 0, width: 10, height: (self.view.frame.size.width / 2) - 100)
        myLayer.addSublayer(hour)
    }
    
    private func createMinuteArrow() {
        minute.backgroundColor = UIColor.black.cgColor
        minute.anchorPoint = CGPoint(x: 0.5, y: 0)
        minute.position = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2)
        minute.bounds = CGRect(x: 0, y: 0, width: 6, height: (self.view.frame.size.width / 2) - 50)
        myLayer.addSublayer(minute)
    }
    
    private func createSecondArrow() {
        second.backgroundColor = UIColor.red.cgColor
        second.anchorPoint = CGPoint(x: 0.5, y: 0)
        second.position = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2)
        second.bounds = CGRect(x: 0, y: 0, width: 3, height: (self.view.frame.size.width / 2) - 20)
        myLayer.addSublayer(second)
    }
    
    private func createDataCalendar() -> [Int] {
        let dataComponents = calendar.dateComponents([.month, .day, .hour, .minute, .second], from: date)
        let hours = dataComponents.hour
        let minutes = dataComponents.minute
        let seconds = dataComponents.second
        print("Time is: \(hours!) : \(minutes!) : \(seconds!)")
        return [hours!, minutes!, seconds!]
    }
    
    private func calculateAnglesForArrowsOfClock() -> [CGFloat] {
        actualTime = createDataCalendar()
        
        let hourOfAngle = (CGFloat(actualTime[0] * (360 / 12)) + (CGFloat(actualTime[1]) * (1.0 / 60) * (360 / 12)))
        let minuteOfAngle = CGFloat(actualTime[1] * (360 / 60))
        let secondOfAngle = CGFloat(actualTime[2] * (360 / 60))
        
        hour.transform = CATransform3DMakeRotation(hourOfAngle / CGFloat(180 * Double.pi), 0, 0, 1)
        minute.transform = CATransform3DMakeRotation(minuteOfAngle / CGFloat(180 * Double.pi), 0, 0, 1)
        second.transform = CATransform3DMakeRotation(secondOfAngle / CGFloat(180 * Double.pi), 0, 0, 1)
        
        return [hourOfAngle, minuteOfAngle, secondOfAngle]
    }
    
    private func createAnimationForEachLayer() {
        
        timeFloat = calculateAnglesForArrowsOfClock()
        
        // Hours
        
        let hoursAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        hoursAnimation.repeatCount = Float.infinity
        hoursAnimation.duration = CFTimeInterval(60 * 60 * 12)
        hoursAnimation.isRemovedOnCompletion = false
        hoursAnimation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        hoursAnimation.fromValue = ((timeFloat[0] + 180) * CGFloat(pi / 180))
        hoursAnimation.byValue = 2 * Double.pi
        hour.add(hoursAnimation, forKey: "HoursAnimationKey")

        
        // Minutes
        
        let minutesAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        minutesAnimation.repeatCount = Float.infinity
        minutesAnimation.duration = 60 * 60
        minutesAnimation.isRemovedOnCompletion = false
        minutesAnimation
            .timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        let fromValue = ((timeFloat[1] + 180) * CGFloat(pi / 180))
        let toValue = 2 * pi
        minutesAnimation.fromValue = fromValue
        minutesAnimation.byValue = toValue
        minute.add(minutesAnimation, forKey: "MinutesAnimationKey")
        

        
        // Seconds
        
        let secondsAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        secondsAnimation.repeatCount = Float.infinity
        secondsAnimation.duration = 60
        secondsAnimation.isRemovedOnCompletion = false
        secondsAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        secondsAnimation.fromValue = (timeFloat[2] + 180) * CGFloat(pi / 180)
        secondsAnimation.byValue = (2 * pi)
        second.add(secondsAnimation, forKey: "SecondAnimationKey")
        
    }

}

