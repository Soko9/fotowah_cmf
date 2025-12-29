import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/shared/extensions/string_extensions.dart';
import 'package:fotowah_cmf/app/core/shared/extensions/time_extensions.dart';
import 'package:fotowah_cmf/app/core/shared/extensions/widget_extensions.dart';
import 'package:fotowah_cmf/app/core/theme/app_colors.dart';
import 'package:fotowah_cmf/app/src/quran/models/quran_circle_model.dart';
import 'package:fotowah_cmf/app/src/quran/widgets/quran_box.dart';

class QuranHomeScreen extends StatelessWidget {
  const QuranHomeScreen({required this.quranCircle, super.key});
  static const route = '/quran-home';

  final QuranCircleModel quranCircle;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.quran.withValues(alpha: 0.2),
        title: Text('حلقة ${quranCircle.name}'),
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
                QuranBox(
                  title: 'الشيخ',
                  value: quranCircle.quranCircleManager?.fullName,
                ).expanded,
                QuranBox(
                  title: 'الموعد الاسبوعي',
                  value: quranCircle.weeklyGatherings
                      ?.map(
                        (gathering) =>
                            '${gathering.weekday}  ${gathering.timeOfDay.time}',
                      )
                      .join('   ~   ')
                      .arabicNum,
                ).expanded,
              ],
            ),
          ],
        ),
      ),
    );
  }
}
