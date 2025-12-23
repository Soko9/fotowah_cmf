import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/src/home/home_screen.dart';

class NoRoute extends StatelessWidget {
  const NoRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: 12,
          children: [
            Text(
              '404\nالصفحة غير موجودة',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.displayLarge,
            ),
            ElevatedButton(
              onPressed: () async {
                await Navigator.of(
                  context,
                ).pushNamedAndRemoveUntil(
                  HomeScreen.route,
                  (_) => false,
                );
              },
              child: const Text('الرجوع إلى الرئيسية'),
            ),
          ],
        ),
      ),
    );
  }
}
