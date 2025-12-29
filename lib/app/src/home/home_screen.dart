import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/config/window_custom_top_bar.dart';
import 'package:fotowah_cmf/app/core/shared/models/section_model.dart';
import 'package:fotowah_cmf/app/src/home/widgets/section_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
      body: Center(
        child: Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: 16,
          runSpacing: 16,
          children: SectionModel.dummyList()
              .map((section) => SectionTile(section: section))
              .toList(),
        ),
      ),
    );
  }
}
