//
//  QR.swift
//  Shell-Revelry
//
//  Created by John Montejano on 9/8/16.
//  Copyright © 2016 John Montejano. All rights reserved.
//

import UIKit
import AVFoundation

protocol BarcodeDelegate {
    
}

class QR: UIViewController, BarcodeDelegate {

    @IBOutlet weak var codeTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    func barcodeReaded (barcode:String){
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func barcodeIsReaded(barcode:String){
            print("barcode: \(barcode)")
        codeTextView.text = barcode
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        let barCodeViewController: QR = segue.destinationViewController as! QR
        barCodeViewController.delegate = self
    }

}
