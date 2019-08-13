//
//  Decrypt.swift
//  otpGenerator
//
//  Created by sehosseini on 7/23/19.
//  Copyright © 2019 sehosseini. All rights reserved.
//

import Foundation
import IDZSwiftCommonCrypto


class Decrypt {
    
    // encript string
    var text: String
    
    // default key
    var salt: String
    
    init(text: String, salt: String) {
        self.salt = salt
        self.text = text
    }
    
    convenience init(text: String) {
        let key = OTPConfig.shared.salt
        self.init(text: text, salt: key)
    }
    
    // get decript otpkey who get from server
    func decrypt() -> String? {
        
        let hxb = text.hexToBytes
        let bs = Data(hxb).base64EncodedString()
        
        let key = Array(salt.utf8)
        let bytes = [UInt8](Data(base64Encoded: bs)!)
        let cryptor = Cryptor(operation: .decrypt, algorithm: .des, options: [.ECBMode, .PKCS7Padding], key: key, iv:[UInt8]())
        if let decrypted = cryptor.update(byteArray: bytes)?.final() {
            return String(bytes: decrypted, encoding: .utf8)
        }
        return nil
    }
    
}
