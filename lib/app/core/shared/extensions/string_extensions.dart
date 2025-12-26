import 'dart:ui';

extension StringX on String {
  Color get fromHex {
    var hexString = replaceAll('#', '').toUpperCase();

    if (hexString.length == 6) {
      hexString = 'FF$hexString';
    }

    return Color(int.parse(hexString, radix: 16));
  }
}
