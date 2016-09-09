//
//  IntroScreen.swift
//  Shell-Revelry
//
//  Created by MakeSchool on 9/9/16.
//  Copyright © 2016 John Montejano. All rights reserved.
//

import UIKit

class IntroScreen: ViewController {
    
    @IBOutlet var RevelLogo: UIImageView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIView.animateWithDuration(1, delay: 1, options: UIViewAnimationOptions.CurveEaseIn, animations: {
            self.RevelLogo.alpha = 0
        }) { _ in
            self.RevelLogo.removeFromSuperview()
        }
        
    }
    
    
    
}
