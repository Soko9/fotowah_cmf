import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String route = '/';

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
