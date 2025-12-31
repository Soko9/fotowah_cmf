import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/shared/extensions/widget_extensions.dart';
import 'package:fotowah_cmf/app/core/shared/widgets/app_error_message.dart';
import 'package:fotowah_cmf/app/core/shared/widgets/app_loader.dart';
import 'package:fotowah_cmf/app/core/theme/app_colors.dart';
import 'package:fotowah_cmf/app/src/quran/circle/circle_controller.dart';
import 'package:fotowah_cmf/app/src/quran/widgets/quran_box.dart';
import 'package:get/get.dart';

class CircleView extends GetView<CircleController> {
  const CircleView({super.key});

  static const route = '/circle';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.quran.withValues(alpha: 0.2),
        title: Text('حلقة ${controller.quranCircle!.name}'),
        centerTitle: false,
      ),
      body: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: Obx(
          () => controller.isLoading
              ? const AppLoader(color: AppColors.quran)
              : controller.errorMessage.isNotEmpty
              ? AppErrorMessage(message: controller.errorMessage)
              : Column(
                  spacing: 12,
                  children: [
                    Row(
                      spacing: 24,
                      children: [
                        QuranBox(
                          title: 'الشيخ',
                          value: controller
                              .quranCircle!
                              .quranCircleManager
                              ?.fullName,
                        ).expanded,
                        QuranBox(
                          title: 'الموعد الاسبوعي',
                          value: controller.quranCircle!.weeklyGatherings
                              ?.map((gathering) => gathering)
                              .join('   ~   '),
                        ).expanded,
                      ],
                    ),
                  ],
                ),
        ),
      ),
    );
  }
}
