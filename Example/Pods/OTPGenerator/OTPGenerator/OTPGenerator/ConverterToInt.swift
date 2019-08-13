//
//  BitConverterToInt.swift
//  otpGenerator
//
//  Created by sehosseini on 7/23/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import Foundation

class ConverterToInt {
    
    var hmac: [UInt8]
    
    init(hmac: [UInt8]) {
        self.hmac = hmac
    }
    
    func dt() -> Int {
        
        let hmacr = self.hmac.map { Int32(bitPattern: UInt32($0)) }
        
        let ff: Int32 = 0xff
        let offset: Int = Int(hmacr[19] & 0xf)
        let binCode = (hmacr[offset] & 0x7f) << 24
            | (hmacr[offset + 1] & ff) << 16
            | (hmacr[offset + 2] & ff) << 8
            | (hmacr[offset + 3] & ff)
        
        return Int(binCode)
    }
    
}
