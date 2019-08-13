//
//  OTP.swift
//  otpGenerator
//
//  Created by sehosseini on 7/23/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import Foundation


public class OTP {
    
    // get otp key
    var key: [UInt8]
    
    // count of key
    var digit: Int
    
    // time of key to alive
    var duration: Int
    
    public init(key: [UInt8], digit: Int, duration: Int) {
        self.key = key
        self.digit = digit
        self.duration = duration
    }
    
    // get HOTP key
    func HOTP() -> Int {
        
        let counter = getCounter()
        
        let toByte = ConverterToByte(value: counter)
        
        let counterByte = toByte.getBytes()
        
        let algoritm = Algoritm(key: self.key, value: counterByte)
        
        let hmac = algoritm.hmac()
        
        let trun = truncate(hmacResult: hmac)
        
        return trun
    }
    
    
    // truncat hmac algoritm whit digit
    private func truncate(hmacResult: [UInt8]) -> Int {
        
        let toInt = ConverterToInt(hmac: hmacResult)
        
        let sNum: Int = toInt.dt()
        
        let result = sNum % Int(pow(10.0, Double(self.digit)))
        
        return result
    }
    
    
    // get counter from time interval
    private func getCounter() -> UInt64 {
        
        let dt = Date()
        
        let time: UInt64 = UInt64(dt.timeIntervalSince1970)
        
        let count = time / UInt64(self.duration)
        
        return count
        
    }
    
}
