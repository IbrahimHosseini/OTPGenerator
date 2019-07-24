//
//  Algoritm.swift
//  otpGenerator
//
//  Created by sehosseini on 7/23/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import Foundation
import CommonCrypto


class Algoritm {
    
    var key: [UInt8]
    var value: [UInt8]
    
    init(key: [UInt8], value: [UInt8]) {
        self.value = value
        self.key = key
    }
    
    func hmac() -> [UInt8] {
        
        var digest = [UInt8](repeating: 0, count: Int(CC_SHA1_DIGEST_LENGTH))
        
        CCHmac(CCHmacAlgorithm(kCCHmacAlgSHA1), self.key, self.key.count, self.value, self.value.count, &digest)
        
        return digest
    }
    
}
