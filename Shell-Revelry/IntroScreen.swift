//
//  IntroScreen.swift
//  Shell-Revelry
//
//  Created by MakeSchool on 9/9/16.
//  Copyright © 2016 John Montejano. All rights reserved.
//

import UIKit
import ProgressHUD
import JSQMessagesViewController
import JSQSystemSoundPlayer

class IntroScreen: ViewController {
    
    @IBOutlet var RevelLogo: UIImageView!
    var startTime = NSTimeInterval()
    var timer = NSTimer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animateWithDuration(1, delay: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.RevelLogo.alpha = 0
        }) { _ in
            self.RevelLogo.removeFromSuperview()
        }
        
    }
    func updateTime() {
              timer = NSTimer(timeInterval: 30, target: self, selector: #selector(self.showRemainingVC), userInfo: nil, repeats: false)
            ProgressHUD.show("Fueling Tank⛽")

        
        
//        var currentTime = NSDate.timeIntervalSinceReferenceDate()
//        
//        var elapsedTime: NSTimeInterval = currentTime - startTime
//        
//        let minutes = UInt8(elapsedTime / 60.0)
//        
//        elapsedTime -= (NSTimeInterval(minutes) * 60)
//        
//        let seconds = UInt8(elapsedTime)
//        
//        elapsedTime -= NSTimeInterval(seconds)
//        
//        let fraction = UInt8(elapsedTime * 100)
//        
//        let strMinutes = String(format: "%02d", minutes)
//        
//        let strSeconds = String(format: "%02d", seconds)
//        
//        let strFraction = String(format: "%02d", fraction)
//        
//        stopWatchLabel.text = "\(strMinutes):\(strSeconds):\(strFraction)"
//          startTime = NSDate.timeIntervalSinceReferenceDate()
        
    }
    
    func showRemainingVC() {
        // performe segue to Remaining balance view controller
        ProgressHUD.dismiss()
        JSQSystemSoundPlayer.jsq_playMessageSentSound()
        performSegueWithIdentifier("receipt", sender: nil)
   
    }


    
    
}
