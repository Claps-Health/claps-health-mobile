package com.example.app

import android.os.Bundle
import android.util.Log
import androidx.annotation.NonNull
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity: FlutterActivity() {

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(flutterEngine.dartExecutor.binaryMessenger, ChannelName).setMethodCallHandler {
            call, result ->
            when(call.method) {
                "getKeyPair" -> {
                    val mnemonic = call.argument<String>("mnemonic")
                    val keyPair = generateKeyPairFromMnemonic(mnemonic!!)
                    result.success(keyPair)
                }
                "signMessage" -> {
                    val message = call.argument<String>("message")
                    val privateKey = call.argument<String>("privateKey")
                    val signature = signTheMessage(message!!, privateKey!!)
                    result.success(signature)
                }
                else -> result.notImplemented()
            }
        }
    }

}
