//
//  GenKeyPair.swift
//  Runner
//
//  Created by Harvey Tai on 2023/4/15.
//

import Foundation
import EncryptingSwift

func generateKeys(mnemonic: String) -> Dictionary<String, String> {
    let pubKey = "PublicKey"
    let priKey = "PrivateKey"
    
    var keyPairMap: Dictionary<String, String> = [:]
    
    if let keyPair = try? KeyPairFactory.sr25519.generate(
        phrase: mnemonic,
        passphrase: ""
    ) {
        keyPairMap = [pubKey: keyPair.publicKey.toHexString(), priKey: keyPair.privateKey.toHexString()]
    } else {
        keyPairMap = [:]
    }
    
    return keyPairMap
}
