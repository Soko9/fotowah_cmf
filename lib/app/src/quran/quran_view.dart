import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/shared/widgets/app_error_message.dart';
import 'package:fotowah_cmf/app/core/shared/widgets/app_loader.dart';
import 'package:fotowah_cmf/app/core/theme/app_colors.dart';
import 'package:fotowah_cmf/app/src/quran/quran_controller.dart';
import 'package:fotowah_cmf/app/src/quran/widgets/circle_tile.dart';
import 'package:get/get.dart';

class QuranView extends GetView<QuranController> {
  const QuranView({super.key});

  static const route = '/quran';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.quran.withValues(alpha: 0.2),
        title: const Text('حلقات القرآن'),
        centerTitle: false,
      ),
      body: Obx(
        () => controller.isLoading
            ? const AppLoader(color: AppColors.quran)
            : controller.errorMessage.isNotEmpty
            ? AppErrorMessage(message: controller.errorMessage)
            : Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  spacing: 16,
                  runSpacing: 16,
                  children: controller.circles
                      .map(
                        (circle) => CircleTile(circle: circle),
                      )
                      .toList(),
                ),
              ),
      ),
    );
  }
}
