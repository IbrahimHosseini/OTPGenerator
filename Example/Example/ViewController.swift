//
//  ViewController.swift
//  Example
//
//  Created by Pazandish on 8/13/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import UIKit
import OTPGenerator

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // set otp key (required)
        let otpKey = "515E4097850E2F77452F4CB4A4D89438"
        
        // set a duration who a key can be use (required)
        let duration = 60
        
        // set count of code (required)
        let digits = 4
        
        // set salt key (base on your decrypt code)
        let salt = "rvfnaped"
        OTPConfig.shared.salt = salt
        
        // initial OTPGenerator class
        let otp = OTPGenerator(otpKey: otpKey, duration: duration, digits: digits)
        
        // call generate fanction to get code
        let result = otp.generate()
        
        // print code in terminal
        print("OTP key -> \(result)")
        
    }


}

