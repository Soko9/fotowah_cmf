import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/shared/models/section_model.dart';
import 'package:fotowah_cmf/app/src/home/widgets/section_tile.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const String route = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GridView.count(
          padding: const EdgeInsets.all(16),
          mainAxisSpacing: 16,
          crossAxisSpacing: 16,
          crossAxisCount: 4,
          shrinkWrap: true,
          children: SectionModel.dummyList().map((section) {
            return SectionTile(section: section);
          }).toList(),
        ),
      ),
    );
  }
}
