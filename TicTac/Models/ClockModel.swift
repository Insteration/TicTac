//
//  ClockModel.swift
//  TicTac
//
//  Created by Artem Karmaz on 3/6/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit

class Clock: UIViewController {
    
    var timer = Timer()
    
    private var hour = CALayer()
    private var minute = CALayer()
    private var second = CALayer()
    private var watchFace = CALayer()
    private let pi = Double.pi
    private let myLayer = CALayer()
    private var currentDateAndTime = [Int]()
    private var timeFloatWithPositionOfArrows = [CGFloat]()
    
    
    private func createMyLayer() {
        myLayer.frame = self.view.frame
        self.view.layer.addSublayer(myLayer)
    }
    
    func createWatchFace() {
        watchFace.backgroundColor = UIColor.clear.cgColor
        watchFace.anchorPoint = CGPoint(x: 0.5, y: 0.5)
        watchFace.position = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2)
        watchFace.bounds = CGRect(x: 0, y: 0, width: ((self.view.frame.size.width / 2) - 20) * 2, height: ((self.view.frame.size.width / 2) - 20) * 2)
        watchFace.contents = Preferences.watchFaceName
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
    
    func createSecondArrow() {
        second.backgroundColor = Preferences.secondArrowColor
        second.anchorPoint = CGPoint(x: 0.5, y: 0)
        second.position = CGPoint(x: self.view.frame.size.width / 2, y: self.view.frame.size.height / 2)
        second.bounds = CGRect(x: 0, y: 0, width: 3, height: (self.view.frame.size.width / 2) - 20)
        second.isHidden = Preferences.secondArrow
        myLayer.addSublayer(second)
    }
    
    private func getDataFromCalendar() -> [Int] {
        
        let date = Date()
        let calendar = Calendar(identifier: .gregorian)
        
        let dataComponents = calendar.dateComponents([.month, .day, .hour, .minute, .second], from: date)
        
        let month = dataComponents.month
        let day = dataComponents.day
        let hours = dataComponents.hour
        let minutes = dataComponents.minute
        let seconds = dataComponents.second
        
        return [month!, day!, hours!, minutes!, seconds!]
    }
    
    private func calculateAnglesForArrowsOfClock() -> [CGFloat] {
        
        currentDateAndTime = getDataFromCalendar()
        
        let hourOfAngle = (CGFloat(currentDateAndTime[2] * (360 / 12)) + (CGFloat(currentDateAndTime[3]) * (1.0 / 60) * (360 / 12)))
        let minuteOfAngle = CGFloat(currentDateAndTime[3] * (360 / 60))
        let secondOfAngle = CGFloat(currentDateAndTime[4] * (360 / 60))
        
        hour.transform = CATransform3DMakeRotation(hourOfAngle / CGFloat(180 * Double.pi), 0, 0, 1)
        minute.transform = CATransform3DMakeRotation(minuteOfAngle / CGFloat(180 * Double.pi), 0, 0, 1)
        second.transform = CATransform3DMakeRotation(secondOfAngle / CGFloat(180 * Double.pi), 0, 0, 1)
        
        return [hourOfAngle, minuteOfAngle, secondOfAngle]
    }
    
    private func createAnimationForEachLayer() {
        
        timeFloatWithPositionOfArrows = calculateAnglesForArrowsOfClock()
        
        // Hours
        let hoursAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        hoursAnimation.repeatCount = Float.infinity
        hoursAnimation.duration = CFTimeInterval(60 * 60 * 12)
        hoursAnimation.isRemovedOnCompletion = false
        hoursAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        hoursAnimation.fromValue = ((timeFloatWithPositionOfArrows[0] + 180) * CGFloat(pi / 180))
        hoursAnimation.byValue = 2 * pi
        hour.add(hoursAnimation, forKey: "HoursAnimationKey")
        
        // Minutes
        let minutesAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        minutesAnimation.repeatCount = Float.infinity
        minutesAnimation.duration = 60 * 60
        minutesAnimation.isRemovedOnCompletion = false
        minutesAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        minutesAnimation.fromValue = ((timeFloatWithPositionOfArrows[1] + 180) * CGFloat(pi / 180))
        minutesAnimation.byValue = 2 * pi
        minute.add(minutesAnimation, forKey: "MinutesAnimationKey")
        
        // Seconds
        let secondsAnimation = CABasicAnimation(keyPath: "transform.rotation.z")
        secondsAnimation.repeatCount = Float.infinity
        secondsAnimation.duration = 60
        secondsAnimation.isRemovedOnCompletion = false
        secondsAnimation.timingFunction = CAMediaTimingFunction(name: .linear)
        secondsAnimation.fromValue = (timeFloatWithPositionOfArrows[2] + 180) * CGFloat(pi / 180)
        secondsAnimation.byValue = (2 * pi)
        second.add(secondsAnimation, forKey: "SecondAnimationKey")
        
    }
    
    func createClock() {
        createMyLayer()
        createHourArrow()
        createMinuteArrow()
        createAnimationForEachLayer()
    }
    
}
