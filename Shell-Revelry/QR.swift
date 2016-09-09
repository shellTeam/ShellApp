//
//  QR.swift
//  Shell-Revelry
//
//  Created by John Montejano on 9/8/16.
//  Copyright © 2016 John Montejano. All rights reserved.
//

import UIKit

class QR: UIViewController, BarcodeDelegate {

    @IBOutlet weak var codeTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func barcodeIsReaded(barcode:String){
            print("barcode: \(barcode)")
        codeTextView.text = barcode
    }

}
