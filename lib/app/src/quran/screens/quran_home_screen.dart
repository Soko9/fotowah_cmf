import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/src/quran/models/quran_circle_model.dart';

class QuranHomeScreen extends StatelessWidget {
  const QuranHomeScreen({required this.quranCircle, super.key});
  static const route = '/quran-home';

  final QuranCircleModel quranCircle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('حلقة ${quranCircle.name}'),
        centerTitle: false,
      ),
      body: Placeholder(
        color: quranCircle.section?.sectionColor ?? Colors.grey,
      ),
    );
  }
}
