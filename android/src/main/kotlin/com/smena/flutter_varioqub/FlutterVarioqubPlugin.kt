package com.smena.flutter_varioqub

import android.app.Application
import android.content.Context
import androidx.annotation.NonNull

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result
import com.yandex.varioqub.appmetricaadapter.AppmetricaAdapter
import com.yandex.varioqub.config.FetchError
import com.yandex.varioqub.config.OnFetchCompleteListener
import com.yandex.varioqub.config.Varioqub
import com.yandex.varioqub.config.VarioqubSettings

class FlutterVarioqubPlugin : FlutterPlugin, MethodCallHandler {
    private lateinit var channel: MethodChannel
    private var context: Context? = null
    private var application: Application? = null

    override fun onAttachedToEngine(@NonNull flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
        context = flutterPluginBinding.applicationContext
        application = flutterPluginBinding.applicationContext as Application
        channel = MethodChannel(flutterPluginBinding.binaryMessenger, "flutter_varioqub")
        channel.setMethodCallHandler(this)
    }

    override fun onMethodCall(@NonNull call: MethodCall, @NonNull result: Result) {
        when (call.method) {
            "init" -> {
                val clientId = call.argument<String?>("client_id")
                if (clientId == null) {
                    result.error("Client id (appmetrica.XXXXXXX) = null", null, null)
                }
                val settings = VarioqubSettings.Builder(clientId!!).withThrottleInterval(100)
                    .build()

                Varioqub.init(settings, AppmetricaAdapter(context!!), context!!)
                result.success(null)
            }

            "set_default" -> {
                val defaultMap = call.argument<Map<String, Any>?>("default_map")
                Varioqub.setDefaults(defaultMap!!)
                result.success(null)

            }

            "get_bool" -> {
                val boolKey = call.argument<String?>("bool_key")
                if (boolKey == null) {
                    result.error("Key is null", null, null)
                }
                val value = Varioqub.getBoolean(boolKey!!)
                result.success(value)
            }

            "get_string" -> {
                val stringKey = call.argument<String?>("string_key")
                if (stringKey == null) {
                    result.error("Key is null", null, null)
                }
                val value = Varioqub.getString(stringKey!!)
                result.success(value)
            }

            "get_double" -> {
                val doubleKey = call.argument<String?>("double_key")
                if (doubleKey == null) {
                    result.error("Key is null", null, null)
                }
                val value = Varioqub.getDouble(doubleKey!!)
                result.success(value)
            }

            "get_long" -> {
                val longKey = call.argument<String?>("long_key")
                if (longKey == null) {
                    result.error("Key is null", null, null)
                }
                val value = Varioqub.getLong(longKey!!)
                result.success(value)
            }

            "get_id" -> {
                val id = Varioqub.getId()
                result.success(id)
            }

            "fetch_config" -> {
                Varioqub.fetchConfig(object : OnFetchCompleteListener {
                    override fun onSuccess() {

                        result.success(null)
                    }

                    override fun onError(message: String, error: FetchError) {
                        result.error(message, null, null)
                    }
                })
            }

            "activate_config" -> {
                Varioqub.activateConfig()
                result.success(null)
            }
        }
    }

    override fun onDetachedFromEngine(@NonNull binding: FlutterPlugin.FlutterPluginBinding) {
        channel.setMethodCallHandler(null)
    }
}
