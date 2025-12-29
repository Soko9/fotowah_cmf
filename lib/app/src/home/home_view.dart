import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/config/window_custom_top_bar.dart';
import 'package:fotowah_cmf/app/src/home/home_controller.dart';
import 'package:fotowah_cmf/app/src/home/widgets/section_tile.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    final isWindows = defaultTargetPlatform == TargetPlatform.windows;

    return Scaffold(
      appBar: isWindows
          ? const WindowCustomTopBar(
              title: 'فتوة الأقصى',
            )
          : AppBar(
              title: const Text('فتوة الأقصى'),
              centerTitle: false,
            ),
      body: Obx(
        () => controller.isLoading
            ? Center(
                child: CircularProgressIndicator(
                  color: Theme.of(context).colorScheme.primary,
                ),
              )
            : controller.errorMessage.isNotEmpty
            ? Center(
                child: Text(
                  controller.errorMessage,
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.error,
                    fontSize: 16,
                  ),
                  textAlign: TextAlign.center,
                ),
              )
            : Center(
                child: Wrap(
                  alignment: WrapAlignment.center,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  runAlignment: WrapAlignment.center,
                  spacing: 16,
                  runSpacing: 16,
                  children: controller.sections
                      .map(
                        (section) => SectionTile(section: section),
                      )
                      .toList(),
                ),
              ),
      ),
    );
  }
}
