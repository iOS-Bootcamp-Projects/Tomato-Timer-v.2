//
//  ViewController.swift
//  Tomato Timer v.2
//
//  Created by Aamer Essa on 19/12/2022.
//

import Cocoa

class ViewController: NSViewController {

    @IBOutlet weak var start_stopBtn: NSButton!
    @IBOutlet weak var timerLabel: NSTextField!
    
        var timer = Timer()
        var count = Int()
        var timerCounting = false
        var timeLeft = 1500
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }

    @IBAction func onClickStrat_StopBtn(_ sender: Any) {
        if !timerCounting {
                 timerCounting = true
                 timer.invalidate()
                 start_stopBtn.title = "Stop"
                 timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
                 
             } else {
                 timerCounting = false
                 timer.invalidate()
                 start_stopBtn.title = "Start"
                 
             }
    }
    @IBAction func break_(_ sender: Any) {
        timer.invalidate()
        timeLeft = 300
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
        timerCounting = true
        start_stopBtn.title = "Stop"
        timerLabel.textColor = .green
        
       
        
    }
    
    @IBAction func tomato(_ sender: Any) {
        
               timer.invalidate()
               timeLeft = 1500
               timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerCounter), userInfo: nil, repeats: true)
               timerCounting = true
               start_stopBtn.title = "Stop"
        timerLabel.textColor = .white
    }
    
    @objc func timerCounter(){
            
            timeLeft -= 1
               var currentTime = timeLeft
               let minutes = Int(currentTime/60)
               currentTime -= minutes * 60
               let seconds = Int(currentTime)
               let strMinutes = minutes > 9 ? String(minutes): "0" + String(minutes)
               let strSeconds = seconds > 9 ? String(seconds): "0" + String(seconds)
               timerLabel.stringValue = "\(strMinutes):\(strSeconds)"
            
        }
}

