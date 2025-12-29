import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/shared/extensions/widget_extensions.dart';
import 'package:fotowah_cmf/app/core/theme/app_colors.dart';
import 'package:fotowah_cmf/app/src/quran/widgets/quran_box.dart';

class QuranHomeView extends StatelessWidget {
  const QuranHomeView({super.key});

  static const route = '/quran-home';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.quran.withValues(alpha: 0.2),
        title: const Text('حلقة '),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: Column(
          spacing: 12,
          children: [
            Row(
              spacing: 24,
              children: [
                const QuranBox(
                  title: 'الشيخ',
                ).expanded,
                const QuranBox(
                  title: 'الموعد الاسبوعي',
                ).expanded,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
