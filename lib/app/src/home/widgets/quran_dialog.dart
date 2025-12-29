import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/shared/extensions/context_extensions.dart';

class QuranDialog extends StatelessWidget {
  const QuranDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: context.theme.scaffoldBackgroundColor,
      elevation: 0,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      constraints: BoxConstraints(
        maxHeight: context.height * 0.5,
        maxWidth: context.width * 0.4,
      ),
      child: Padding(
        padding: const EdgeInsetsDirectional.all(16),
        child: ListView.builder(
          itemCount: 0,
          itemBuilder: (_, index) {
            if (index == 0) {
              return Text('اختر حلقة', style: context.textTheme.titleLarge);
            }
            return const SizedBox.shrink();
          },
        ),
      ),
    );
  }
}
