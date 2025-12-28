import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/config/window_controls.dart';
import 'package:fotowah_cmf/app/core/shared/extensions/context_extensions.dart';
import 'package:fotowah_cmf/app/core/theme/app_colors.dart';

class WindowCustomTopBar extends StatelessWidget
    implements PreferredSizeWidget {
  const WindowCustomTopBar({this.title, this.isCenter = false, super.key});

  final String? title;
  final bool isCenter;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      padding: const EdgeInsets.symmetric(horizontal: 8),
      alignment: Alignment.center,
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: Row(
          spacing: 16,
          children: [
            Expanded(
              child: Text(
                title ?? '',
                textAlign: isCenter ? TextAlign.center : TextAlign.start,
                style: context.textTheme.titleLarge,
              ),
            ),
            const IconButton(
              onPressed: WindowControls.minimize,
              color: AppColors.text,
              iconSize: 32,
              icon: Icon(Icons.remove),
            ),
            IconButton(
              onPressed: WindowControls.close,
              iconSize: 32,
              color: context.colorScheme.error,
              icon: const Icon(Icons.close),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight * 1.5);
}
