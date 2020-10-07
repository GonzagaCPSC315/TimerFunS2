//
//  ViewController.swift
//  TimerFunS2
//
//  Created by Gina Sprint on 10/5/20.
//  Copyright © 2020 Gina Sprint. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var secondsLabel: UILabel!
    
    // MARK: - Timer
    // use a timer when you want code (closure) to execute periodically (after some time passes)
    // 2 types of timers
    // 1. non-repeating
    // 2. repeating
    // use the invalidate() method to stop the timer
    var timer: Timer? = nil
    
    // task: define a seconds property (Int)
    // with a property observer that updates secondsLabel
    var seconds: Int = 0 {
        didSet {
            secondsLabel.text = "\(seconds)"
        }
    }
    // task: when the user presses pause or reset, we need to invalidate the timer and set timer = nil (plus something else for reset)
    
    func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { (timer) in
            print("tick")
            self.seconds += 1 // fully qualify external reference names
            // recall closures "capture" external refernces
            // closures execute LATER
            // potentially, the ViewController could be deallocated and the closure tries to refer to its seconds property... bad
            // closures keep their external references in scope/memory
        })
    }
    
    func stopTimer() {
        timer?.invalidate() // optional chaining
        timer = nil
    }
    
    @IBAction func startPressed(_ sender: UIButton) {
        print("hello from start")
        if timer == nil {
            startTimer()
        }
    }
    
    @IBAction func pausePressed(_ sender: UIButton) {
        print("hello from pause")
        stopTimer()
    }
    
    @IBAction func resetPressed(_ sender: UIButton) {
        print("hello from reset")
        stopTimer()
        seconds = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

