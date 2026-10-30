//
//  ViewController.swift
//  TimerTutorial
//
//  Created by Zülal Nebin on 30.10.2026.
//

import UIKit

class ViewController: UIViewController {
    
    var timer: Timer?
    let timerDuration = 2.5
    var runCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //        timer = Timer.scheduledTimer(withTimeInterval: timerDuration, repeats: true, block: timerDidFinish)
        
        timer = Timer.scheduledTimer(timeInterval: timerDuration, target: self, selector: #selector(timerDidFire), userInfo: nil, repeats: true)
    }
    
    func timerDidFinish(t: Timer) {
        print("Zaman sonu")
        
        runCount += 1
        
        if runCount == 3 {
            timer?.invalidate()
        }
    }
    
    @objc func timerDidFire() {
        print("Zaman sonu")
        
        runCount += 1
        
        if runCount == 3 {
            timer?.invalidate()
        }
    }
    
    
}

