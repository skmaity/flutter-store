import 'package:flutter/services.dart';

class NonSystemAppList {
  static const MethodChannel _channel = MethodChannel('app_list');

  static Future<List<String>> getNonSystemApps() async {
    final List<dynamic> apps = await _channel.invokeMethod('getNonSystemApps');
    return apps.cast<String>();
  }
}
