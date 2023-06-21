package com.example.app

import dev.sublab.encrypting.keys.KeyPair
import dev.sublab.encrypting.keys.KeyPairFactory
import dev.sublab.encrypting.mnemonic.SubstrateSeedFactory
import dev.sublab.hex.hex
import dev.sublab.sr25519.DEFAULT_LABEL
import dev.sublab.sr25519.Sr25519Keypair
import dev.sublab.sr25519.sr25519

const val ChannelName = "com.clapsHealth.dev/genKeyPair"
private const val publicKey = "PublicKey"
private const val privateKey = "PrivateKey"

fun sr25519KeyGen(label: String = DEFAULT_LABEL) = object : KeyPairFactory {
    override val seedFactory get() = SubstrateSeedFactory()
    override fun load(seedOrPrivateKey: ByteArray) =
        seedOrPrivateKey.sr25519(label).loadPrivateKey().let {
            Sr25519Keypair(
                it,
                it.sr25519(label).publicKey(),
                label
            )
        }
}

fun generateKeyPairFromMnemonic(mnemonic: String): Map<String, String> {
    val keyPair: KeyPair = sr25519KeyGen().generate(mnemonic)
    val publicKeyHex = keyPair.publicKey.hex.encode()
    val privateKeyHex = keyPair.privateKey.hex.encode()

    return hashMapOf(publicKey to publicKeyHex, privateKey to privateKeyHex)
}

fun signTheMessage(message: String, privateKey: String): String {
    val myKeyPair: KeyPair = sr25519KeyGen().load(privateKey.hex.decode())
    val signature: ByteArray = myKeyPair.sign(message.toByteArray())

    return signature.hex.encode()
}