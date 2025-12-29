import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/shared/extensions/context_extensions.dart';
import 'package:fotowah_cmf/app/core/theme/app_colors.dart';
import 'package:fotowah_cmf/app/src/quran/models/quran_circle_model.dart';
import 'package:fotowah_cmf/app/src/quran/screens/quran_home_screen.dart';

class QuranDialog extends StatelessWidget {
  const QuranDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      constraints: BoxConstraints(
        maxHeight: context.height * 0.5,
        maxWidth: context.width * 0.4,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: ListView.builder(
          itemCount: QuranCircleModel.dummyList().length + 1,
          itemBuilder: (_, index) {
            if (index == 0) {
              return Text('اختر حلقة', style: context.textTheme.titleLarge);
            }
            final circle = QuranCircleModel.dummyList()[index - 1];
            return Padding(
              padding: const EdgeInsetsDirectional.symmetric(vertical: 8),
              child: InkWell(
                onTap: () async {
                  Navigator.of(context).pop();
                  await Navigator.of(
                    context,
                  ).pushNamed(QuranHomeScreen.route, arguments: circle);
                },
                child: ListTile(
                  tileColor: AppColors.quran.withValues(
                    alpha: 0.4,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(4),
                  ),
                  title: Text(circle.name),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
