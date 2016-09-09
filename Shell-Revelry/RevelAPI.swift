//
//  RevelAPI.swift
//  Shell-Revelry
//
//  Created by Jorge Bastos on 9/9/16.
//  Copyright © 2016 John Montejano. All rights reserved.
//

import Foundation


class RevelAPI {
    
    // /resources/CustomerGroup/?format=json&id=1
    let BASE_URL = "https://teamb-hackathon.revelup.com"
    let CUSTOMER = "/resources/Customer/?format=json"
    let CUSTOMER_GROUP = "/resources/CustomerGroup/?format=json"
    let CHECK_SYSTEM_SETTINGS = "https://teamb-hackathon.revelup.com/weborders/system_settings/?establishment=2"
    let SUBMIT_ORDER = "/specialresources/cart/submit/"
    let orderPath = NSBundle.mainBundle().pathForResource("order", ofType: "json")
    
    private var session = NSURLSession(configuration: NSURLSessionConfiguration.defaultSessionConfiguration())
    private var task = NSURLSessionDataTask()
    
    func getCustomerUID(uid: String) {
        let userUrl = "https://teamb-hackathon.revelup.com/crm/customers/?format=json&id=30&api_key=6614e24ac06b4d1c806440fba7cbcda1&api_secret=d3c2762f1d0d44bd9d39f7580b329217e9e9c2c6e95e4a07b2496debb22a8db0"
        let USER = "&id=\(uid)"
        let url = "\(BASE_URL)\(CUSTOMER)\(USER)\(API_KEY)\(API_SECRET)"
        let request = NSURLRequest(URL: NSURL(string: url)!)
        task = session.dataTaskWithRequest(request, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            if error == nil {
                if let data = data {
                    let dataContent = NSString(data: data, encoding: NSUTF8StringEncoding)
                }
            }
        })
        task.resume()
    }
    
    func loadJson() -> [String:AnyObject]? {
        if let orderPath = self.orderPath, data = NSData(contentsOfFile: orderPath) {
            do {
                let json = try NSJSONSerialization.JSONObjectWithData(data, options: []) as! [String:AnyObject]
                print(json)
                return json
            } catch let error {
                
            }
        }
        return nil
    }
    
    func POST() {
        let orderUrl = "\(BASE_URL)\(SUBMIT_ORDER)\(API_KEY)\(API_SECRET)"
        
        let request = NSMutableURLRequest(URL: NSURL(string: orderUrl)!)
        request.HTTPMethod = "POST"
        request.cachePolicy = NSURLRequestCachePolicy.ReloadIgnoringCacheData
        
        if let json = loadJson() {
            let data = NSKeyedArchiver.archivedDataWithRootObject(json)
            task = session.uploadTaskWithRequest(request, fromData: data, completionHandler: { (postData: NSData?, response: NSURLResponse?, error: NSError?) in
                print("Data:", postData, "Response", response, "Error", error)
            })
            task.resume()
        }
        
    }
    
    func GET() -> [String:AnyObject] {
        return [String:AnyObject]()
    }
    
    func request(url: String) {
        let request = NSURLRequest(URL: NSURL(string: url)!)
        task = session.dataTaskWithRequest(request, completionHandler: { (data: NSData?, response: NSURLResponse?, error: NSError?) in
            if let error = error {
                print(error)
            } else {
                if let data = data {
                    let dataContent = NSString(data: data, encoding: NSUTF8StringEncoding)
//                    print("Error:", "\(error)\n","Response:", "\(response)\n", "\(dataContent)")
                }
            }
        })
        task.resume()
    }
}


struct RSOrder {
    
    var item = [String:AnyObject]()
    var modifiersItems = [String:AnyObject]()
    var modifier = [String:AnyObject]()
    var order = [String:AnyObject]()
    
    
    mutating func generateOrder() {
        
        modifier = ["modifier":40, "modifier_price":1.46, "qty": 15.80, "qty_type":0, "admin_mod_key": NSNull()]
        modifiersItems["modifieritems"] = modifier
        
    }
    
    
}



















