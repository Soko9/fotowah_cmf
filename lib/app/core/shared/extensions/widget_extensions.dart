import 'package:flutter/material.dart';

extension WidgetX on Widget {
  MaterialPageRoute<dynamic> get wrapper => MaterialPageRoute(
    builder: (_) => this,
  );

  Expanded get expanded => Expanded(child: this);
}
