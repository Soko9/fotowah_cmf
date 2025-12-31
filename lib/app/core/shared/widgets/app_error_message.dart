import 'package:flutter/material.dart';
import 'package:fotowah_cmf/app/core/shared/extensions/context_extensions.dart';

class AppErrorMessage extends StatelessWidget {
  const AppErrorMessage({required this.message, super.key});
  final String message;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: Text(
          message,
          textAlign: TextAlign.center,
          style: context.textTheme.bodyMedium?.copyWith(
            color: context.colorScheme.error,
          ),
        ),
      ),
    );
  }
}
