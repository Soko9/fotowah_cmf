import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/config/window_custom_top_bar.dart';
import 'package:fotowah_cmf/app/core/shared/models/section_model.dart';
import 'package:fotowah_cmf/app/src/home/widgets/section_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const WindowCustomTopBar(
        title: 'فتوة الأقصى',
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
