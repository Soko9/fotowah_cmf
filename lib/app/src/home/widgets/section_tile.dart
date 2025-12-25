import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/shared/models/section_model.dart';

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

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onHover: (_) => setState(() => _isHovering = true),
      onExit: (_) => setState(() => _isHovering = false),
      child: InkWell(
        onTap: () {},
        child: Stack(
          children: [
            AnimatedPositioned(
              duration: const Duration(milliseconds: 500),
              top: _isHovering ? 32 : 8,
              right: _isHovering ? 32 : 8,
              child: AnimatedScale(
                duration: const Duration(milliseconds: 450),
                scale: _isHovering ? 6 : 1,
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds: 450),
                  opacity: _isHovering ? 0.4 : 1,
                  child: Icon(
                    widget.section.icon,
                    size: 48,
                    color: widget.section.color ?? Colors.grey,
                  ),
                ),
              ),
            ),
            Positioned.fill(
              child: Container(
                height: 100,
                decoration: BoxDecoration(
                  color: (widget.section.color ?? Colors.grey).withValues(
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
    );
  }
}
