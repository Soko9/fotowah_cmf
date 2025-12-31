import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:fotowah_cmf/app/core/managers/assets_manager.dart';
import 'package:fotowah_cmf/app/core/theme/app_colors.dart';

class AppLoader extends StatefulWidget {
  const AppLoader({this.color = AppColors.primary, super.key});
  final Color color;

  @override
  State<AppLoader> createState() => _AppLoaderState();
}

class _AppLoaderState extends State<AppLoader>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 750),
    );

    unawaited(_controller.repeat(reverse: true));

    final curvedAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.easeInOutSine,
    );

    _scaleAnimation = Tween<double>(begin: 1, end: 1.15).animate(
      curvedAnimation,
    );
    _opacityAnimation = Tween<double>(begin: 0.5, end: 1).animate(
      curvedAnimation,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FadeTransition(
        opacity: _opacityAnimation,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: widget.color.withValues(alpha: 0.3),
                  blurRadius: 32,
                  spreadRadius: 2,
                ),
              ],
            ),
            child: SvgPicture.asset(
              AssetsManager.logoSvg,
              width: 120,
              height: 120,
              // colorFilter: ColorFilter.mode(widget.color, BlendMode.srcIn),
            ),
          ),
        ),
      ),
    );
  }
}
