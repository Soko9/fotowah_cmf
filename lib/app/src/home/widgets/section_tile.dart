import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fotowah_cmf/app/core/shared/enums/section_enum.dart';
import 'package:fotowah_cmf/app/core/shared/extensions/context_extensions.dart';
import 'package:fotowah_cmf/app/core/shared/models/section_model.dart';
import 'package:fotowah_cmf/app/src/home/widgets/quran_dialog.dart';

class SectionTile extends StatefulWidget {
  const SectionTile({
    required this.section,
    super.key,
  });

  final SectionModel section;

  @override
  State<SectionTile> createState() => _SectionTileState();
}

class _SectionTileState extends State<SectionTile> {
  bool _isHovering = false;

  Future<void> _showCircles() async {
    await showAdaptiveDialog<void>(
      context: context,
      barrierDismissible: true,
      builder: (context) => const QuranDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    final logoSize = context.width * 0.05;

    return MouseRegion(
      onHover: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: InkWell(
        onTap: () async {
          switch (widget.section.type) {
            case SectionEnum.quran:
              await _showCircles();
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
        child: SizedBox(
          height: context.height * 0.4,
          width: context.width * 0.2,
          child: Stack(
            children: [
              if (widget.section.sectionLogo != null)
                AnimatedPositioned(
                  duration: const Duration(milliseconds: 250),
                  curve: Curves.easeInOut,
                  top: _isHovering ? logoSize * 0.5 : 8,
                  right: _isHovering ? logoSize * 0.5 : 8,
                  child: AnimatedScale(
                    duration: const Duration(milliseconds: 250),
                    curve: Curves.easeInOut,
                    scale: _isHovering ? 4 : 1,
                    child: AnimatedOpacity(
                      duration: const Duration(milliseconds: 250),
                      curve: Curves.easeInOut,
                      opacity: _isHovering ? 0.25 : 1,
                      child: SvgPicture.asset(
                        widget.section.sectionLogo!,
                        height: logoSize,
                        width: logoSize,
                        colorFilter: ColorFilter.mode(
                          widget.section.sectionColor,
                          BlendMode.srcIn,
                        ),
                      ),
                    ),
                  ),
                ),
              Positioned.fill(
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.section.sectionColor.withValues(
                      alpha: 0.3,
                    ),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  padding: const EdgeInsets.all(8),
                  child: Center(
                    child: Text(
                      widget.section.name,
                      style: Theme.of(context).textTheme.titleLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
