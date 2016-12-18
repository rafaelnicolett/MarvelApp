//
//  Credentials.swift
//  MarvelApp
//
//  Created by Rafael Nicoleti on 16/12/16.
//  Copyright © 2016 Rafael Nicoleti. All rights reserved.
//

import Foundation

struct Credentials {
    static let apiPublicKey = "4c056080bfefc0da027baafda2a10544"
    static let apiPrivatKey = "dcd64c5464a170434a8726ef7ec0fb6a71810d94"
    
    static let timeStamp = formatter.string(from: Date())
    static let hash = "\(timeStamp)\(apiPrivatKey)\(apiPublicKey)".md5
    
    private static let formatter: DateFormatter = {
        let f = DateFormatter()
        f.dateFormat = "yyyyMMddHHmmss"
        return f
    }()
}

extension String {
    var md5: String {
        let str = cString(using: String.Encoding.utf8) ?? []
        let strLen = CUnsignedInt(lengthOfBytes(using: String.Encoding.utf8))
        let digestLen = Int(CC_MD5_DIGEST_LENGTH)
        let result = UnsafeMutablePointer<CUnsignedChar>.allocate(capacity: digestLen)
        
        CC_MD5(str, strLen, result)
        
        var hash = String()
        for i in 0..<digestLen {
            hash += String(format: "%02x", result[i])
        }
        
        result.deinitialize()
        
        return hash
    }
}
