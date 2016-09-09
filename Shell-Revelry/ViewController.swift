//
//  ViewController.swift
//  Shell-Revelry
//
//  Created by John Montejano on 9/8/16.
//  Copyright © 2016 John Montejano. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBarHidden = true
        
        // Do any additional setup after loading the view, typically from a nib.
        
        let revelApi = RevelAPI()
        revelApi.POST()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

