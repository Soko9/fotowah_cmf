import 'dart:convert';

import 'package:flutter/services.dart';

class DummyService {
  Future<Map<String, dynamic>> getSections() async {
    await Future<void>.delayed(const Duration(seconds: 2));

    final jsonString = await rootBundle.loadString(
      'assets/dummy/dummy_sections.json',
    );

    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getQuranCirclesLookup() async {
    await Future<void>.delayed(const Duration(seconds: 2));

    final jsonString = await rootBundle.loadString(
      'assets/dummy/dummy_circles_lookup.json',
    );

    return jsonDecode(jsonString) as Map<String, dynamic>;
  }

  Future<Map<String, dynamic>> getQuranCircles(String id) async {
    await Future<void>.delayed(const Duration(seconds: 2));

    final jsonString = await rootBundle.loadString(
      'assets/dummy/dummy_circles.json',
    );

    final result = jsonDecode(jsonString) as Map<String, dynamic>;

    return (result['quran_circles'] as List<dynamic>).firstWhere(
          (e) => (e as Map<String, dynamic>)['id'] == id,
        )
        as Map<String, dynamic>;
  }
}
