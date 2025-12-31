import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/shared/extensions/context_extensions.dart';
import 'package:fotowah_cmf/app/core/theme/app_colors.dart';
import 'package:fotowah_cmf/app/src/quran/circle/circle_view.dart';
import 'package:fotowah_cmf/app/src/quran/models/quran_circle_model.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class CircleTile extends StatelessWidget {
  const CircleTile({
    required this.circle,
    super.key,
  });

  final QuranCircleModel circle;

  @override
  Widget build(BuildContext context) {
    final shape = ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(120),
    );

    return Material(
      shape: shape,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: context.height * 0.4,
        width: context.width * 0.2,
        child: ElevatedButton(
          onPressed: () async {
            await Get.toNamed<void>(CircleView.route, arguments: circle);
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(8),
            backgroundColor: AppColors.quran.withValues(
              alpha: 0.5,
            ),
            elevation: 0,
            shadowColor: Colors.transparent,
            shape: shape,
          ),
          child: Center(
            child: Text(
              circle.name,
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
          ),
        ),
      ),
    );
  }
}
