import 'package:flutter/services.dart';

class WindowControls {
  static const MethodChannel _channel = MethodChannel('window_controls');

  static Future<void> minimize() async {
    await _channel.invokeMethod('minimize');
  }

  static Future<void> close() async {
    await _channel.invokeMethod('close');
  }
}
