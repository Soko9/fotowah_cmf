import 'dart:convert';

import 'package:flutter/services.dart';

class DummyService {
  Future<Map<String, dynamic>> getSections() async {
    await Future<void>.delayed(const Duration(seconds: 4));

    final jsonString = await rootBundle.loadString(
      'assets/dummy/dummy_sections.json',
    );

    return jsonDecode(jsonString) as Map<String, dynamic>;
  }
}
