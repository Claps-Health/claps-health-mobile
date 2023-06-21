//
//  SignMessage.swift
//  Runner
//
//  Created by Harvey Tai on 2023/4/17.
//

import Foundation
import EncryptingSwift

func signTheMessage(message: String, privateKey: String) -> String {
    if let myKeyPair = try? KeyPairFactory.sr25519.load(seedOrPrivateKey: privateKey.hex.decode()) {
        if let sigStr = try? myKeyPair.sign(message: message.data(using: .utf8)!){
            return sigStr.hex.encode()
        } else {
            return ""
        }
    } else {
        return ""
    }
}
