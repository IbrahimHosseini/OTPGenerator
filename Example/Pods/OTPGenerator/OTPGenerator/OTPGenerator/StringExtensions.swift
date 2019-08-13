//
//  StringExtensions.swift
//  otpGenerator
//
//  Created by sehosseini on 7/23/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import Foundation

extension Collection where Element == Character {
    
    // convert hexString to bytes
    var hexToBytes: [UInt8] {
        var last = first
        return dropFirst().compactMap {
            guard
                let lastHexDigitValue = last?.hexDigitValue,
                let hexDigitValue = $0.hexDigitValue else {
                    last = $0
                    return nil
            }
            defer { last = nil }
            return UInt8(lastHexDigitValue * 16 + hexDigitValue)
        }
    }
}
