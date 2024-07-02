import 'package:flutter/services.dart';

class Varioqub {
  static const MethodChannel _channel = MethodChannel('flutter_varioqub');

  static Future<void> init({required String clientId}) async {
    return await _channel.invokeMethod<void>('init', {'client_id': clientId});
  }

  static Future<void> setDefault(
      {required Map<String, dynamic> defaultMap}) async {
    return await _channel
        .invokeMethod<void>('set_default', {'default_map': defaultMap});
  }

  static Future<bool> getBool({required String key}) async {
    return await _channel.invokeMethod('get_bool', {'bool_key': key});
  }

  static Future<String> getString({required String key}) async {
    return await _channel.invokeMethod('get_string', {'string_key': key});
  }

  static Future<double> getDouble({required String key}) async {
    return await _channel.invokeMethod('get_double', {'double_key': key});
  }

  static Future<int> getLong({required String key}) async {
    return await _channel.invokeMethod('get_long', {'long_key': key});
  }

  static Future<String> getId() async {
    return await _channel.invokeMethod('get_id');
  }

  static Future<void> fetchConfig() async {
    return await _channel.invokeMethod<void>('fetch_config');
  }

  static Future<void> activateConfig() async {
    return await _channel.invokeMethod<void>('activate_config');
  }
}
