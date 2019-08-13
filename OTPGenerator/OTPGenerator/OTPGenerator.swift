//
//  OTPGenerator.swift
//  otpGenerator
//
//  Created by sehosseini on 7/23/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import Foundation


public class OTPGenerator {
    
    // otp key get from server
    private var otpKey: String
    
    // duration who key alive
    private var duration: Int
    
    // count of key who generate
    private var digits: Int
    
    
    public init(otpKey: String, duration: Int, digits: Int) {
        self.digits = digits
        self.duration = duration
        self.otpKey = otpKey
    }
    
    // generate HOTP key
    @discardableResult
    public func generate() -> Int {
        return getHOTP()
    }
    
    // get HOTP
    private func getHOTP() -> Int {
        
        let str = self.decrypt()
        let key = str!.hexToBytes
        
        let otp = OTP(key: key, digit: self.digits, duration: self.duration)
        
        return otp.HOTP()
        
    }
    
    // decrypt otpkey string, who receive from server
    private func decrypt() -> String? {
        
        let decrypt = Decrypt(text: self.otpKey)
        
        return decrypt.decrypt()
        
    }
    
}
