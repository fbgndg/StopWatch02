//
//  ViewController.swift
//  StopWatch02
//
//  Created by D7703_19 on 2019. 4. 4..
//  Copyright © 2019년 sin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var startB: UIBarButtonItem!
    @IBOutlet weak var pauseB: UIBarButtonItem!
    @IBOutlet weak var resetB: UIBarButtonItem!
    var time = 0
    //타이머 객체 생성
    var myTimer = Timer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        timeLabel.text = String(time)
        
    }
    @IBAction func startBtnPressed(_ sender: Any) {
        if (myTimer.isValid) {
            return;
 }
        
        
        
        myTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
        
        startB.isEnabled = false
        
        changeButtonState(start: false, puase: true, stop: true)
    }
        /*time = time + 1
        timeLabel.text = String(time)
    }*/
    
    @IBAction func pauseBtnPressed(_ sender: Any) {
    //타이머가 정지 제개 가능
        myTimer.invalidate()
        
        changeButtonState(start: true, puase: false, stop: true)
    }
    
    @IBAction func resetBtnPressed(_ sender: Any) {
    
        myTimer.invalidate()
        time=0
        timeLabel.text = String(time)
        
        changeButtonState(start: true, puase: false, stop: false)
    }
    
    @objc func updateTimer(){
        time+=1
        let min = time/6000
        let sec = time/1000 - (min*60)
        let ssec = time % 100
        let output = String(format: "%02d:%02d:%02d", min, sec, ssec)
        timeLabel.text = output
    }
    
        func changeButtonState(start: Bool, puase: Bool, stop:Bool) {
            startB.isEnabled = start
            pauseB.isEnabled = puase
            resetB.isEnabled = stop
        }

}
