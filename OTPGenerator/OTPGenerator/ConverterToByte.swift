//
//  ConverterToByte.swift
//  otpGenerator
//
//  Created by sehosseini on 7/23/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import Foundation

class ConverterToByte {
    
    var value: UInt64
    
    init(value: UInt64) {
        self.value = value
    }
    
    func getBytes() -> [UInt8] {
        
        var writeBuffer: Array<UInt8> = [0, 0, 0, 0, 0, 0, 0, 0]
        
        writeBuffer[7] =  UInt8((self.value >> 56) & 0xFF)
        writeBuffer[6] =  UInt8((self.value >> 48) & 0xFF)
        writeBuffer[5] =  UInt8((self.value >> 40) & 0xFF)
        writeBuffer[4] =  UInt8((self.value >> 32) & 0xFF)
        writeBuffer[3] =  UInt8((self.value >> 24) & 0xFF)
        writeBuffer[2] =  UInt8((self.value >> 16) & 0xFF)
        writeBuffer[1] =  UInt8((self.value >> 8) & 0xFF)
        writeBuffer[0] =  UInt8((self.value >> 0) & 0xFF)
        
        return writeBuffer
    }
    
}
