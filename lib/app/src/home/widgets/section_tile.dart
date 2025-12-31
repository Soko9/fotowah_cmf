import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fotowah_cmf/app/core/shared/enums/section_enum.dart';
import 'package:fotowah_cmf/app/core/shared/extensions/context_extensions.dart';
import 'package:fotowah_cmf/app/core/shared/models/section_model.dart';
import 'package:fotowah_cmf/app/src/quran/quran_view.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';

class SectionTile extends StatelessWidget {
  const SectionTile({
    required this.section,
    super.key,
  });

  final SectionModel section;

  @override
  Widget build(BuildContext context) {
    final logoSize = context.width * 0.05;

    final shape = ContinuousRectangleBorder(
      borderRadius: BorderRadius.circular(120),
    );

    return Material(
      shape: shape,
      clipBehavior: Clip.antiAlias,
      child: SizedBox(
        height: context.height * 0.4,
        width: context.width * 0.2,
        child: Stack(
          children: [
            if (section.sectionLogo != null)
              Positioned(
                top: 8,
                right: 8,
                child: Transform.scale(
                  scale: 6,
                  child: SvgPicture.asset(
                    section.sectionLogo!,
                    height: logoSize,
                    width: logoSize,
                    colorFilter: ColorFilter.mode(
                      section.sectionColor.withValues(alpha: 0.4),
                      BlendMode.srcIn,
                    ),
                  ),
                ),
              ),
            Positioned.fill(
              child: ElevatedButton(
                onPressed: () async {
                  switch (section.type) {
                    case SectionEnum.quran:
                      await Get.toNamed<void>(QuranView.route);
                    case SectionEnum.women:
                    case SectionEnum.scouts:
                    case SectionEnum.academy:
                    case SectionEnum.relations:
                    case SectionEnum.daawah:
                    case SectionEnum.social:
                    case SectionEnum.sports:
                    case _:
                  }
                },
                style: ElevatedButton.styleFrom(
                  padding: const EdgeInsets.all(8),
                  backgroundColor: section.sectionColor.withValues(
                    alpha: 0.5,
                  ),
                  elevation: 0,
                  shadowColor: Colors.transparent,
                  shape: shape,
                ),
                child: Center(
                  child: Text(
                    section.name,
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
