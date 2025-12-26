import 'dart:ui';

extension ListDoubleX on List<double> {
  Color get fromARGB => Color.from(
    alpha: this[0],
    red: this[1],
    green: this[2],
    blue: this[3],
  );
}
