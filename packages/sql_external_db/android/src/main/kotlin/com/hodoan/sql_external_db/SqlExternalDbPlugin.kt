package com.hodoan.sql_external_db

import android.os.Environment
import android.provider.ContactsContract.Directory
import android.util.Log
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import java.io.File

/** SqlExternalDbPlugin */
class SqlExternalDbPlugin : FlutterPlugin, MethodCallHandler {
    /// The MethodChannel that will the communication between Flutter and native Android
    ///
    /// This local reference serves to register the plugin with the Flutter Engine and unregister it
    /// when the Flutter Engine is detached from the Activity
    private lateinit var channel: MethodChannel

    override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "sql_external_db")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(call: MethodCall, result: Result) {
        if (call.method == "externalPath") {
            val sharedBundle = (call.arguments as String).split("//").first()
            val path = Environment.getExternalStorageDirectory().path
            val dir = File("$path/$sharedBundle")
            if (!dir.exists()) {
                val status = dir.mkdirs()
                if (status) {
                    Log.e(SqlExternalDbPlugin::class.simpleName, "onMethodCall: status ${dir.path}")
                    result.success(dir.path)
                    return
                }else{
                    Log.e(SqlExternalDbPlugin::class.simpleName, "onMethodCall: status false")
                }
            } else {
                result.success(dir.path)
                return
            }
            result.success(null)
        } else {
            result.notImplemented()
        }
    }

    override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
