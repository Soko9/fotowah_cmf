import 'package:flutter/material.dart';

extension TimeX on TimeOfDay {
  String get time {
    final h = hour.toString().padLeft(2, '0');
    final m = minute.toString().padLeft(2, '0');
    return '$h:$m:00';
  }
}
