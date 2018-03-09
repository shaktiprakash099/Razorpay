//
//  ViewController.swift
//  RozerPayIntegration
//
//  Created by GLB-312-PC on 08/03/18.
//  Copyright © 2018 GLB-312-PC. All rights reserved.
//

import UIKit
import Razorpay
class ViewController: UIViewController,RazorpayPaymentCompletionProtocol {

    var razorpay: Razorpay!
    override func viewDidLoad() {
        super.viewDidLoad()
    
        razorpay = Razorpay.initWithKey(Constants.RAZORPAYKEY, andDelegate: self)
        self.showPaymentForm()
        
    }
    

    internal func showPaymentForm(){
        let options: [String:Any] = [
            "amount" : "1000",
            "description": "purchase description",
            "image": "http://pingova.globusdemos.com/pingova/uploads/images/image1520514464948.750000_1520514664947.jpg",
            "name": "business or product name",
            "prefill": [
            "contact": "7000210809",
            "email": "foo@bar.com"
            ],
            "theme": [
                "color": "#0c49b4"
            ]
        ]
        razorpay.open(options)
    }
    
    
    
    //MARK: Rozorpay delegate Methods
    func onPaymentError(_ code: Int32, description str: String) {
        let alertController = UIAlertController(title: "FAILURE", message: str, preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.view.window?.rootViewController?.present(alertController, animated: true, completion: nil)
        
    }
    
    
    func onPaymentSuccess(_ payment_id: String) {
        
        let alertController = UIAlertController(title: "SUCCESS", message: "Payment Id \(payment_id)", preferredStyle: UIAlertControllerStyle.alert)
        let cancelAction = UIAlertAction(title: "OK", style: UIAlertActionStyle.cancel, handler: nil)
        alertController.addAction(cancelAction)
        self.view.window?.rootViewController?.present(alertController, animated: true, completion: nil)
        
    }
    
}

