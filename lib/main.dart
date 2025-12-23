import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/theme/app_theme.dart';

void main() {
  runApp(const System());
}

class System extends StatelessWidget {
  const System({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fotowah CMF',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Text(
          'فتوة الأقصى',
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
    );
  }
}
