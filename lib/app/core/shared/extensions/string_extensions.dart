import 'package:flutter/material.dart';

extension StringX on String {
  Color get fromHex {
    var hexString = replaceAll('#', '').toUpperCase();

    if (hexString.length == 6) {
      hexString = 'FF$hexString';
    }

    return Color(int.parse(hexString, radix: 16));
  }

  TimeOfDay get time {
    final parts = split(':');
    return TimeOfDay(
      hour: int.parse(parts[0]),
      minute: int.parse(parts[1]),
    );
  }
}
