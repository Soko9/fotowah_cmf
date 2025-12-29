import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/shared/extensions/context_extensions.dart';
import 'package:fotowah_cmf/app/core/theme/app_colors.dart';

class QuranBox extends StatelessWidget {
  const QuranBox({
    required this.title,
    this.value,
    this.icon,
    super.key,
  });

  final String title;
  final String? value;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.quran.withValues(alpha: 0.7),
        borderRadius: BorderRadius.circular(4),
      ),
      padding: const EdgeInsetsDirectional.all(12),
      margin: const EdgeInsetsDirectional.all(8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: 1,
            children: [
              Text(title, style: context.textTheme.titleMedium),
              Text(value ?? '-', style: context.textTheme.bodyMedium),
            ],
          ),
          if (icon != null)
            Icon(
              icon,
              color: AppColors.quran.withValues(alpha: 0.9),
              size: 64,
            ),
        ],
      ),
    );
  }
}
